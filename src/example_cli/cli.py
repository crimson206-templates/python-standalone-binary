"""CLI implementation."""

from cleo.application import Application
from cleo.commands.command import Command
from cleo.helpers import argument, option

__version__ = "0.1.0"  # 직접 버전 정의

class HelloCommand(Command):
    name = "hello"
    description = "Greet someone."
    
    options = [
        option("name", "n", "Who to greet", flag=False, default="World"),
    ]
    
    def handle(self) -> int:
        name = self.option("name")
        self.line(f"Hello {name}!")
        return 0

class AddCommand(Command):
    name = "add"
    description = "Add two numbers."
    
    arguments = [
        argument("x", "First number", optional=False),
        argument("y", "Second number", optional=False),
    ]
    
    def handle(self) -> int:
        x = int(self.argument("x"))
        y = int(self.argument("y"))
        self.line(f"{x} + {y} = {x + y}")
        return 0

def main():
    """Entry point for the application."""
    application = Application("example-cli", __version__)
    application.add(HelloCommand())
    application.add(AddCommand())
    return application.run()

if __name__ == "__main__":
    main() 