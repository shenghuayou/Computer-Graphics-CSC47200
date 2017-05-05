# Computer-Graphics-CSC47200

*Homework repository for Computer Graphics (CSc 47200) taken at CCNY*

## Group Members
* [Shenghua You](https://github.com/shenghuayou), shenghuayou@gmail.com
* [Victor Fung](https://github.com/VictorFung1), victor.fung122@gmail.com

## Dependencies
* OpenGL graphics library:
  Legacy OpenGL (<3.1), Shader-Based OpenGL (3.1+), GLSL
  
* Qt user interface library:
  Cross-platform software for implementing modern user interfaces for your homework projects
  
## Language
* C++

### Homework One
* Download [CS472.skel.zip](http://www-cs.ccny.cuny.edu/~wolberg/cs472/code/CS472.skel.zip) to get the skeleton code for creating a Qt-based application in which each homework assignment gets installed in a separate submenu.

* Each homework assignment will require you to implement a class (e.g., HW1, HW2, ...). A sample HW0 class is implemented for you to see several fully working implementations. The source code is in the CS472.skel/hw0 subdirectory. The skeleton code for the first homework assignment can be found in the CS472.skel/hw1 subdirectory. All of the Qt code necessary to collect parameters for all homeworks is entirely supplied to you so that you don't need to spend time on the graphical user interface. You only need to fill in the stubs in hw1/HW1*.cpp where it says "// PUT YOUR CODE HERE". Your homework assignment will be installed under menu HW1 in the menubar.

* In homework 1a, write a program that partitions a window into a set of nine viewports (e.g., a 3x3 grid of viewports). File hw1/HW1a.cpp gives you a list of 16 vertices that approximate the outline of the letter P. In each viewport, draw that vertex list using GL_POINTS, GL_LINES, GL_LINE_STRIP, GL_LINE_LOOP, GL_TRIANGLES, GL_TRIANGLE_STRIP, GL_TRIANGLE_FAN, GL_QUADS, and GL_POLYGON, respectively. 

* The viewports should be ordered from left to right, bottom to top. Use the glViewport(x, y, w, h) function, where (w,h) is the viewport width and height, and (x,y) is the position of the bottom left corner of the viewport. Note that (0,0) is the bottom left corner of the canvas. Set the background and foreground colors to black and white, respectively, for all drawings. Do not use shader code for this assignment. Just use the supplied vector of 32 floats that holds the (x,y) coordinates of the 16 vertices and make calls to glVertex2f() to draw the data in each viewport using each of the nine drawing modes (e.g., GL_POINTS, GL_LINES, ...).
* In homework 1b, write a program that draws a triangle. A slider is used to control the rotation angle and radio buttons are used to turn on/off the twist feature as discussed in class. The twist feature simply modifies the rotation angle of a given vertex by making the rotation matrix a function of angle AND distance of the vertex from the origin (center of widget). In order to see the twist effect, the triangle must be tesselated into triangular components, which can be produced by recursive subdivision. A slider is used to control the number of subdivisions. This value is only used to render the triangle if the twist setting is turned on by the twist radio button. Assign a random color to each triangular facet.

* Make sure to write (or refer to) the following functions to complete this assignment:
  triangle(a, b, c) should rotate/twist vertices a, b, and c. The three transformed vertices get pushed onto a vector called m_points. Each of these vertices gets the same random color assigned to it. Those values are pushed onto a vector called m_colors.
  divideTriangle(a, b, c, count) should recurse count times. At each level of recursion, the function splits one triangle into four triangles until the base case is reached (count reaches 0). Then, triangle(a, b, c) is called to save away the triangle data into m_points and m_colors.

* The graphical user interface code invokes changeTheta(n), changeSubdiv(n), and changeTwist(flag) as functions that respond to changes in the sliders or radio buttons. Please note that the n parameter is the slider value. These functions will clear the m_points (and possibly m_colors) vector so that new values can be pushed into them when processing the geometry under new GUI settings.

### Homework Two
* Modify the two programs you wrote in Homework #1 to effectively use the GPU. For a given number of subdivisions, record the triangle vertices into an array and do not apply rotation/twist computations to that array. Instead, pass that array to the GPU and let the vertex shader apply the rotation/twist. When you change the rotation angle with the slider, do not refresh the original array of vertex positions. Instead, pass the Twist flag and Theta (rotation angle) to the vertex shader to recompute triangle vertex positions. This should better exploit the parallelism of the GPU so you should see a noticeable improvement in speed.


### Homework Three
* Replace the random colors you used to draw the triangles in Homework #2 with texture mapping instead. Use mandrill.jpg as the texture image. Download the updated skeletal code [file](http://www-cs.ccny.cuny.edu/~wolberg/cs472/code/CS472.skel.zip) again to help you get started. Use two sets of vertex and fragment shaders to draw the texture mapped image as well as a wireframe drawing of the triangles to outline the triangle edges in white.

* Download [wave.zip](http://www-cs.ccny.cuny.edu/~wolberg/cs472/hw/wave/wave.zip) The skeletal code [file](http://www-cs.ccny.cuny.edu/~wolberg/cs472/code/CS472.skel.zip) contains the source code of a basic mesh-based wave program written using shader-based OpenGL using Qt. Please fill in the areas which are marked with "PUT YOUR CODE HERE." The program allows you to select among Wireframe, Textured, and Textured+Wireframe for the display, and among ten different surface geometries. A slider is used to select the grid size, which varies from 2 to 64 for a 2x2 to a 64x64 grid. A Start/Stop pushbutton triggers the animation.
