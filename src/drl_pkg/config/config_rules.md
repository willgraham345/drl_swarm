Configs should be of the following format:

```yaml
robots:
  robot_type_1:
      agent1:
        name: "<robotType_agentNumber>"
        uri: ""
        translation: [-0, -0, 0.015]
        orientation: [0, 0, 0, 1]
    #   orientation: [0, 0, 0, 1]
  robot_type2:
      agent1:
        name: "<robotType_agentNumber>"
        uri: ""
        translation: [0, -0.2, 0.015]
        orientation: [0, 0, 0, 1]

      agent2:
        name: "<robotType_agentNumber>"
        uri: ""
        translation: [0, 0.2, 0.015]
        orientation: [0, 0, 0, 1]

additional_stuff
```


Things to keep in mind. 
- Translation and orientation should be of type: `float` or `int`

## How to create a configured swarm in a given world.
1. Add base world to `webots_pkg/worlds/base_worlds` directory
2. Add configuration (following above rules) to `webots_pkg/config/` directory.
3. Take configuration file path created in step 2, and input it into the macro: `CONFIG_FILE_INPUT` defined in `write_swarm_to_world.py` script.
4. Navigate terminal to `webots_pkg/config` directory
5. Execute `write_swarm_to_world.py` script by invoking in terminal:
```shell
python write_swarm_to_world.py
```
6. Confirm a new configured world has been written to `webots_pkg/worlds/configured_worlds` directory. 
7. If desired, reference this in the simulation launch file of choice. 
