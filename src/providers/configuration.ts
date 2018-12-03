import * as vscode from 'vscode';

export function registerConfigurationProvider(): void {
	vscode.debug.registerDebugConfigurationProvider("Ruby", new RubyConfigurationProvider());
}

class RubyConfigurationProvider implements vscode.DebugConfigurationProvider {

	public provideDebugConfigurations(folder: vscode.WorkspaceFolder, token: vscode.CancellationToken): Thenable<vscode.DebugConfiguration[]> {
		const names = rubyConfigurations.map((config) => config.name);

		return vscode.window.showQuickPick(names).then((selected: string) => {
			return [rubyConfigurations.find((config) => config.name === selected)];
		});
	}

	public resolveDebugConfiguration?(folder: vscode.WorkspaceFolder | undefined, debugConfiguration: vscode.DebugConfiguration): vscode.ProviderResult<vscode.DebugConfiguration> {

		return { ...debugConfiguration, cwd: "${workspaceRoot}" };
	}
}

const rubyConfigurations: vscode.DebugConfiguration[] = [
	{
		"name": "Debug Local File",
		"type": "Ruby",
		"request": "launch",
		"program": "${workspaceRoot}/main.rb"
	},
	{
		"name": "Listen for rdebug-ide",
		"type": "Ruby",
		"request": "attach",
		"remoteHost": "127.0.0.1",
		"remotePort": "1234",
		"remoteWorkspaceRoot": "${workspaceRoot}"
	},
	{
		"name": "Rails server",
		"type": "Ruby",
		"request": "launch",
		"program": "${workspaceRoot}/bin/rails",
		"args": [
			"server"
		]
	},
	{
		"name": "RSpec - all",
		"type": "Ruby",
		"request": "launch",
		"program": "${workspaceRoot}/bin/rspec",
		"args": [
			"-I",
			"${workspaceRoot}"
		]
	},
	{
		"name": "RSpec - active spec file only",
		"type": "Ruby",
		"request": "launch",
		"program": "${workspaceRoot}/bin/rspec",
		"args": [
			"-I",
			"${workspaceRoot}",
			"${file}"
		]
	},
	{
		"name": "Cucumber",
		"type": "Ruby",
		"request": "launch",
		"program": "${workspaceRoot}/bin/cucumber"
	}
]