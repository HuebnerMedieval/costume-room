# Costume-Room
This is a web application which allows costume designers to create and store costumes, and to associate those costumes with specific actors. A costumer can also check all of the costumes they have designed for a particular actor, or filter their costumes by completion status and historical authenticity.

## Getting Started
### Prerequisites

This application requires the 'devise', 'omniauth', 'omniauth-github', and 'dotenv-rails' gems.

### Installation
To install this application, please download a copy at:

        https://github.com/HuebnerMedieval/costume-room

Once installed, run bundle install.

Run rake db:migrate

### Running The Application
Currently the application only runs locally on localhost

from the root folder, run `rails s` to start up the server.

In order to use the application, you must either log in, or create a new account. You can do this through a form or through github.

Once in the application, there are navigation links at the top to create a new costume, or to view the user's costumes and actors. New costumes default to WIP status. Costumes can be edited or deleted once they are created, although you cannot change the actor.

When you are done, there is a button at the top to log out.

## Author
* Eli Huebner - @HuebnerMedieval

## License
This project is licensed under the MIT licence:

Copyright (c) 2020 Eli Huebner

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
