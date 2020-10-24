# Blender-3D-CLI
A custom CLI for rendering 3D files in Blender 3D. Plus an optional emailing service setup with SwithMail.

## Blender-Rendering Usage

This uses similar arguments to the original Blender rendering command.

`blender -b file.blend -f 10`
* **-b** render in the background (without UI)
* **file.blend** path to blend file to render
* **-f 10**  render a specific frame [10]

`blender -b file.blend -a`
* **-a** render the whole animation

`blender -b file.blend -s 10 -e 500 -a`
* **-s 10** sets the start frame of the animation [10]
*  **-e 500** sets the end frame of the animation [500] 

## Automatic Email Service (Optional)

You can optionally enable and setup [SwithMail](https://www.tbare.com/software/swithmail/) to automatically text/email you when the render completes.

You have to download and setup SwithMail yourself, should you chose to do so.


