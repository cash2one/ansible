#!/bin/env python

import ansible.runner

if __name__ == '__main__':
	runner = ansible.runner.Runner(
					inventory=ansible.inventory.Inventory('inventory'),
					pattern='local',
					module_name='setup',
					remote_pass='liuhui')
	data = runner.run()
	print(data)
