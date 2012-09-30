Heroku Xcode Plugin
-------------------

Heroku-Xcode is a Heroku CLI plugin that downloads environment variables from an app to an Xcode configuration file (.xcconfig).

## Installation

Install the [Heroku Toolbelt](https://toolbelt.heroku.com), if you have not done so already. Once installed, you'll have access to the `heroku` command from your command shell.

Next, install the Heroku-Xcode plugin with the following command:

```
$ sudo heroku plugins:install https://github.com/heroku/heroku-xcode.git
```

## Usage

Run the following command in the directory containing your Xcode project, substituting the name of your Heroku app for `app_name`:

```
$ heroku config:xcode -a app_name
```

If successful, this command will generate a file with a name like `app_name.xcconfig`.

To add this configuration file to your Xcode project, select the Project file from the Project Navigator, and select the project again from the sidebar, under the "Project" heading. Under "Configurations", set the Debug, Release, and / or Ad Hoc to be based on the `app_name` configuration.

![Xcode Configuration](https://github.com/heroku/heroku-xcode/raw/gh-pages/xcode-configuration-screenshot.png)

Now in your project, you will have access to these values (such as `DATABASE_URL`) in code.

## Contact

Mattt Thompson

- http://github.com/mattt
- http://twitter.com/mattt
- mattt@heroku.com

## License

Heroku-Xcode is available under the MIT license. See the LICENSE file for more info.
