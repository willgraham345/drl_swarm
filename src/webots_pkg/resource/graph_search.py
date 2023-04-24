#!/usr/bin/env python
'''
Package providing helper classes and functions for performing graph search operations for planning.
'''
import sys
import numpy as np
import heapq
import matplotlib.pyplot as plotter
from math import hypot, sqrt

_DEBUG = False
_DEBUG_END = True
_ACTIONS = ['l','r','u','d']
_ACTIONS_2 = ['u','d','l','r','ne','nw','sw','se']
_T = 2
_X = 1
_Y = 0
_GOAL_COLOR = 0.75
_INIT_COLOR = 0.25
_PATH_COLOR_RANGE = _GOAL_COLOR-_INIT_COLOR
_VISITED_COLOR = 0.9


class GridMap:
    '''
    Class to hold a grid map for navigation. Reads in a map.txt file of the format
    0 - free cell, x - occupied cell, g - goal location, i - initial location.
    Additionally provides a simple transition model for grid maps and a convience function
    for displaying maps.
    '''
    def __init__(self, init_pos, goal_pos, min_index, max_index, map_path=None):
        '''
        Constructor. Makes the necessary class variables. Optionally reads in a provided map
        file given by map_path.

        map_path (optional) - a string of the path to the file on disk
        '''
        self.rows = None
        self.cols = None
        self.goal = goal_pos
        self.init_pos = init_pos
        # print('init pose: ' + str(self.init_pos))
        self.init_pos[0] = int(self.init_pos[0])
        self.init_pos[1] = int(self.init_pos[1])
        self.occupancy_grid = None
        if map_path is not None:
            self.read_map(map_path)

    def read_map(self, map):
        '''
        Read in a specified map file of the format described in the class doc string.

        map_path - a string of the path to the file on disk
        '''
        self.rows = np.shape(map)[0]
        self.cols = np.shape(map)[1]
        if _DEBUG:
            print('rows', self.rows)
            print('cols', self.cols)
            print(map)
        self.occupancy_grid = np.zeros((self.rows, self.cols), dtype=bool) # changed from np.bool
        for r in range(self.rows):
            for c in range(self.cols):
                if map[r][c] != 0:
                    self.occupancy_grid[r][c] = True
        self.occupancy_grid[self.goal[0],self.goal[1]] = False

    def is_goal(self,s):
        '''
        Test if a specifid state is the goal state

        s - tuple describing the state as (row, col) position on the grid.

        Returns - True if s is the goal. False otherwise.
        '''

        testx = int(s[_X])
        testy = int(s[_Y])

        return (testx == self.goal[_X] and
                testy == self.goal[_Y])
    
    def display_map(self, path):

        display_grid = np.array(self.occupancy_grid, dtype=np.float32)

        if len(path) > 1:
            for i,p in enumerate(path):
                disp_col = _INIT_COLOR + _PATH_COLOR_RANGE*(i+1)/len(path)
                display_grid[int(p[0]),int(p[1])] = disp_col

        display_grid[int(self.init_pos[0]), int(self.init_pos[1])] = _INIT_COLOR
        display_grid[self.goal[0], self.goal[1]] = _GOAL_COLOR

        imgplot = plotter.imshow(display_grid)
        imgplot.set_interpolation('nearest')
        imgplot.set_cmap('Spectral')

        plotter.show(block=False)
        # plotter.pause(0.25)
        # plotter.close()

    def transition(self, s, a):
        '''
        Transition function for the current grid map.

        s - tuple describing the state as (row, col) position on the grid.
        a - the action to be performed from state s

        returns - s_prime, the state transitioned to by taking action a in state s.
        If the action is not valid (e.g. moves off the grid or into an obstacle)
        returns the current state.
        '''
        new_pos = list(s[:])
        # Ensure action stays on the board
        if a == 'u':
            if s[_Y] > 0:
                new_pos[_Y] -= 1
        elif a == 'd':
            if s[_Y] < self.rows - 1:
                new_pos[_Y] += 1
        elif a == 'l':
            if s[_X] > 0:
                new_pos[_X] -= 1
        elif a == 'r':
            if s[_X] < self.cols - 1:
                new_pos[_X] += 1
        elif a == 'ne':
            if s[_Y] > 0 and s[_X] < self.cols - 1:
                new_pos[_Y] -= 1
                new_pos[_X] += 1
        elif a == 'nw':
            if s[_Y] > 0 and s[_X] > 0:
                new_pos[_Y] -= 1
                new_pos[_X] -= 1
        elif a == 'sw':
            if s[_Y] < self.rows - 1 and s[_X] > 0:
                new_pos[_Y] += 1
                new_pos[_X] -= 1
        elif a == 'se':
            if s[_Y] < self.rows - 1 and s[_X] < self.cols - 1:
                new_pos[_Y] += 1
                new_pos[_X] += 1
        else:
            print('Unknown action:', str(a))

        # Test if new position is clear
        if self.occupancy_grid[int(new_pos[0]), int(new_pos[1])]:
            s_prime = np.array(s)
        else:
            s_prime = np.array(new_pos)
        return s_prime
        
    def uninformed_heuristic(self, s):
        '''
        Example of how a heuristic may be provided. This one is admissable, but dumb.

        s - tuple describing the state as (row, col) position on the grid.

        returns - floating point estimate of the cost to the goal from state s
        '''
        return 0.0

    def euclidean_heuristic(self, node):

        heuristic = sqrt((node.state[1] - self.goal[_X])**2 + (node.state[0] - self.goal[_Y])**2)

        return heuristic

    def manhattan_heuristic(self, node):

        heuristic = abs(node.state[1] - self.goal[_X]) + abs(node.state[0] - self.goal[_Y])

        return heuristic


class SearchNode:
    def __init__(self, s, A, parent=None, parent_action=None, cost=0, parent_depth=-1):
        '''
        s - the state defining the search node
        A - list of actions
        parent - the parent search node
        parent_action - the action taken from parent to get to s
        '''
        self.parent = parent
        self.cost = cost
        self.parent_action = parent_action
        self.state = s[:]
        self.actions = A[:]
        self.depth = parent_depth + 1

    def __str__(self):
        '''
        Return a human readable description of the node
        '''
        return str(self.state) + ' ' + str(self.actions)+' '+str(self.parent)+' '+str(self.parent_action)
    def __lt__(self, other):
        return self.cost < other.cost

class PriorityQ:
    '''
    Priority queue implementation with quick access for membership testing
    Setup currently to only with the SearchNode class
    '''
    def __init__(self):
        '''
        Initialize an empty priority queue
        '''
        self.l = [] # list storing the priority q
        self.s = set() # set for fast membership testing

    def __contains__(self, x):
        '''
        Test if x is in the queue
        '''
        return x in self.s

    def push(self, x, cost):
        '''
        Adds an element to the priority queue.
        If the state already exists, we update the cost
        '''
        if x.state in self.s:
            return self.replace(x, cost)
        heapq.heappush(self.l, (cost, x))
        self.s.add(x.state)

    def pop(self):
        '''
        Get the value and remove the lowest cost element from the queue
        '''
        x = heapq.heappop(self.l)
        self.s.remove(x[1].state)
        return x[1]

    def peak(self):
        '''
        Get the value of the lowest cost element in the priority queue
        '''
        x = self.l[0]
        return x[1]

    def __len__(self):
        '''
        Return the number of elements in the queue
        '''
        return len(self.l)

    def replace(self, x, new_cost):
        '''
        Removes element x from the q and replaces it with x with the new_cost
        '''
        for y in self.l:
            if x.state == y[1].state:
                self.l.remove(y)
                self.s.remove(y[1].state)
                break
        heapq.heapify(self.l)
        self.push(x, new_cost)

    def get_cost(self, x):
        '''
        Return the cost for the search node with state x.state
        '''
        for y in self.l:
            if x.state == y[1].state:
                return y[0]

    def __str__(self):
        '''
        Return a string of the contents of the list
        '''
        return str(self.l)

def dfs(init_state, f, is_goal, actions):

    frontier = []
    n0 = SearchNode(init_state, actions)
    visited = []
    frontier.append(n0)
    while len(frontier) > 0:
        # Peak last element
        n_i = frontier.pop()
        print(n_i.state)
        if n_i.state not in visited:
            visited.append(n_i.state)
            if is_goal(n_i.state):
                return (backpath(n_i), visited)
            else:
                for a in actions:
                    s_prime = f(n_i.state, a)
                    n_prime = SearchNode(s_prime, actions, n_i, a)
                    frontier.append(n_prime)

    return ([[init_state],['n']],visited)

def dfs_iter(init_state, f, is_goal, actions):

    while max_depth < 200:
        frontier = []
        n0 = SearchNode(init_state, actions)
        visited = []
        frontier.append(n0)
        while len(frontier) > 0:
            # Peak last element
            n_i = frontier.pop()
            check = [n_i.state, n_i.depth]
            if check not in visited and n_i.depth <= max_depth:
                visited.append([n_i.state,n_i.depth])
                if is_goal(n_i.state):
                    vis = []
                    for idx in range(len(visited)):
                        vis.append(visited[idx][0])
                    return (backpath(n_i), vis)
                else:
                    for a in actions:
                        s_prime = f(n_i.state, a)
                        n_prime = SearchNode(s_prime, actions, n_i, a, parent_depth=n_i.depth)
                        frontier.append(n_prime)
        
        max_depth +=1

    return ([[init_state],['n']],visited)

def bfs(init_state, f, is_goal, actions):
    '''
    Perform breadth first search on a grid map.

    init_state - the intial state on the map
    f - transition function of the form s_prime = f(s,a)
    is_goal - function taking as input a state s and returning True if its a goal state
    actions - set of actions which can be taken by the agent

    returns - ((path, action_path), visited) or None if no path can be found
    path - a list of tuples. The first element is the initial state followed by all states
        traversed until the final goal state
    action_path - the actions taken to transition from the initial state to goal state
    '''

    frontier = []
    n0 = SearchNode(init_state, actions)
    visited = []
    frontier.append(n0)
    while len(frontier) > 0:
        # Peak first element
        n_i = frontier.pop(0)
        in_flag = False
        for elem in visited:
            if all(elem == n_i.state):
                in_flag = True
        if in_flag == False:
            visited.append(n_i.state)
            if is_goal(n_i.state):
                return (backpath(n_i), visited)
            else:
                for a in actions:
                    s_prime = f(n_i.state, a)
                    n_prime = SearchNode(s_prime, actions, n_i, a)
                    frontier.append(n_prime)


    return ([[init_state],['n']],visited)

def uniform_cost_search(init_state, f, is_goal, actions):

    diag = ['ne','nw','sw','se']
    diag_2= [45, 135, 225, 315]
    card = [0, 90, 180, 270]
    turn = ['tl','tr']
    frontier = PriorityQ()
    n0 = SearchNode(init_state, actions)
    visited = []
    frontier.push(n0, n0.cost)
    while len(frontier) > 0:
        # Peak lowest cost element
        n_i = frontier.pop()
        if is_goal(n_i.state):
            for idx in range(len(visited)):
                visited[idx] = visited[idx][:-1]
            return (backpath(n_i), visited)
        visited.append(n_i.state)
        for a in actions:
            s_prime = f(n_i.state, a)
            if a in diag:
                n_prime = SearchNode(s_prime, actions, n_i, a, cost=n_i.cost+1.5)
            elif a == 'f' and n_i.state[2] in diag_2:
                n_prime = SearchNode(s_prime, actions, n_i, a, cost=n_i.cost+1.5)
            elif a == 'f' and n_i.state[2] in card:
                n_prime = SearchNode(s_prime, actions, n_i, a, cost=n_i.cost+1)
            elif a in turn:
                n_prime = SearchNode(s_prime, actions, n_i, a, cost=n_i.cost+0.25)
            else:
                n_prime = SearchNode(s_prime, actions, n_i, a, cost=n_i.cost+1)
            if n_prime.state not in visited and n_prime.state not in frontier:
                frontier.push(n_prime, n_prime.cost)
            elif n_prime.state in frontier:
                if frontier.get_cost(n_prime) > n_prime.cost:
                    frontier.replace(n_prime, n_prime.cost)

    return None

def a_star_search(init_state, f, is_goal, actions, h):
    '''
    init_state - value of the initial state
    f - transition function takes input state (s), action (a), returns s_prime = f(s, a)
        returns s if action is not valid
    is_goal - takes state as input returns true if it is a goal state
        actions - list of actions available
    h - heuristic function, takes input s and returns estimated cost to goal
        (note h will also need access to the map, so should be a member function of GridMap)
    '''
    diag = ['ne','nw','sw','se']
    frontier = PriorityQ()
    n0 = SearchNode(init_state, actions)
    visited = []
    frontier.push(n0, n0.cost)
    while len(frontier) > 0:
        # Peak lowest cost element
        n_i = frontier.pop()
        if is_goal(n_i.state):
            for idx in range(len(visited)):
                visited[idx] = visited[idx][:-1]
            return (backpath(n_i), visited)
        visited.append(n_i.state)
        for a in actions:
            s_prime = f(n_i.state, a)
            hueristic = h(n_i)
            if a in diag:
                n_prime = SearchNode(s_prime, actions, n_i, a, cost=n_i.cost+1.5)
            else:
                n_prime = SearchNode(s_prime, actions, n_i, a, cost=n_i.cost+1)
            if n_prime.state not in visited and n_prime.state not in frontier:
                frontier.push(n_prime, n_prime.cost+hueristic)
            elif n_prime.state in frontier:
                if frontier.get_cost(n_prime) > n_prime.cost+hueristic:
                    frontier.replace(n_prime, n_prime.cost+hueristic)
    return ([[init_state],['n']],visited)

def backpath(node):
    '''
    Function to determine the path that lead to the specified search node

    node - the SearchNode that is the end of the path

    returns - a tuple containing (path, action_path) which are lists respectively of the states
    visited from init to goal (inclusive) and the actions taken to make those transitions.
    '''
    path = []
    action_path = []

    while True:
        if node.parent is None:
            path.append(node.state)
            break
        else:
            path.append(node.state)
            action_path.append(node.parent_action)
            node = node.parent

    path.reverse()
    action_path.reverse()

    return (path, action_path)