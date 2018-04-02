var webpack = require("webpack");
var path = require("path");

var DIST_DIR = path.resolve(__dirname, "dist");
var SRC_DIR = path.resolve(__dirname, "source");

var config = {
	entry: SRC_DIR + "/js/app.js",
	output: {
		path: DIST_DIR + "/js",
		filename: "bundle.js"
	},
	module: {
		rules: [
			{
				test: /\.js?/,
				include: SRC_DIR,
				loader: "babel-loader",
				query: {
					presets: ["react", "es2015", "stage-2"]
				}
			}
		]
	}
};

module.exports = config;