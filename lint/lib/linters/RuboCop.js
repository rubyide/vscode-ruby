"use strict";

function RuboCop(opts) {
	this.exe = "rubocop";
	this.ext = process.platform === 'win32' ? ".bat" : "";
	this.path = opts.path;
	this.responsePath = "stdout";

	this.args = ["-s", "-f", "json", "--force-exclusion", "{path}"];

	if (opts.lint) this.args.push("-l");
	if (opts.only) this.args = this.args.concat("--only", opts.only.join(','));
	if (opts.except) this.args = this.args.concat("--except", opts.except.join(','));
	if (opts.rails) this.args.push('-R');
	if (opts.require) this.args = this.args.concat("-r", opts.require.join(','));
}

RuboCop.prototype.processResult = function (data) {
	let offenses = JSON.parse(data);
	return (offenses.files || [{
		offenses: []
	}])[0].offenses;
};

module.exports = RuboCop;
