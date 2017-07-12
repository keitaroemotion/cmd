# cmd

CMD is the command alias manager. with this alias script you no longer need to type verbose commands, since this scripts provides you easy alias, which is easy to manage.


## How to install

```
$ gem install colorize
$ ./installer
```

## Usage

Help menu

```
$ cmd -h 
```

In order to add a new/update command:

```
cmd -a
```
with this you can jump to the vim editor mode and freely can edit your command like:

```
key=command to execute
```

the alias key and actual command must be connected with equal(=) sign.

The easier way of adding command is yet directly add it on your terminal window, not editor mode. that is:

```
$ cmd -a [key] [commands]
```

For intance, if you want to add alias like `ls -lt`, then

```
$ cmd -a lt ls -lt
```

that's it.


To enlist the commands,

```
$ cmd -l
```

To add the command to the clipboard,

```
$ cmd -cp [key]
```

To dry run the command

```
$ cmd -dr [key]
```

Also, if you want to add additional params to the existing command alias, only you have to do is:

```
$ cmd [key] [arg1] [arg2] ...
```

then it will be executed with the additonal args.


enjoy!


# Contact

**Kei Sugano**
tobasojyo@gmail.com 






