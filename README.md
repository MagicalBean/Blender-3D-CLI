# Blender-3D-CLI
A custom CLI for rendering 3D files in Blender 3D. Plus an optional emailing service setup with SwithMail.

## Setup
**WARNING: This requires a bit of setup**
 1.  Setup all the variables under the **_"VARIABLES"_** section
	 *  Make sure to put the location of your **_"blender.exe"_** file farther down if your using it.
 2.  I'd recommend placing the batch file in it's own directory, and placing that in your PATH variable so you can use the command from anywhere.

## Rendering Usage

This uses similar arguments to the original Blender rendering command.

`render file.blend -f 10`
* **file.blend** path to blend file to render (be sure to include the **_.blend_**)
* **-f 10**  render a specific frame [10]

`render file.blend -a`
* **-a** render the whole animation

`render file.blend -s 10 -e 500 -a`
* **-s 10** sets the start frame of the animation [10]
*  **-e 500** sets the end frame of the animation [500] 

## Automatic Email Service (Optional)

You can optionally enable and setup [SwithMail](https://www.tbare.com/software/swithmail/) to automatically text/email you when the render completes.

You have to download and setup SwithMail yourself, should you chose to do so. SwithMail has pretty good documentation to help you setup it up. Make sure to save the settings to an XML file and to link to it in the batch file. (My XML file (with personal info removed) is in the repo)




