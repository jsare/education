// Base classes GUI
abstract class StatusBar {
  final String system;

  StatusBar(this.system);

  void create();
}

abstract class MainMenu {
  final String system;

  MainMenu(this.system);

  void create();
}

abstract class MainWindow {
  final String system;

  MainWindow(this.system);

  void create();
}

// Derived classes of GUI for Windows
class WindowsStatusBar extends StatusBar {
  WindowsStatusBar() : super('Windows');

  @override
  void create() {
    print('Created StatusBar for $system');
  }
}

class WindowsMainMenu extends MainMenu {
  WindowsMainMenu() : super('Windows');

  @override
  void create() {
    print('Created MainMenu for $system');
  }
}

class WindowsMainWindow extends MainWindow {
  WindowsMainWindow() : super('Windows');

  @override
  void create() {
    print('Created MainWindow for $system');
  }
}

// Derived classes of GUI for Linux
class LinuxStatusBar extends StatusBar {
  LinuxStatusBar() : super('Linux');

  @override
  void create() {
    print('Created StatusBar for $system');
  }
}

class LinuxMainMenu extends MainMenu {
  LinuxMainMenu() : super('Linux');

  @override
  void create() {
    print('Created MainMenu for $system');
  }
}

class LinuxMainWindow extends MainWindow {
  LinuxMainWindow() : super('Linux');

  @override
  void create() {
    print('Created MainWindow for $system');
  }
}

//Base class of the abstract factory
abstract class GuiAbstractFactory {
  StatusBar getStatusBar();
  MainMenu getMainMenu();
  MainWindow getMainWindow();
}

//realization of the abstract factory for Windows
class WindowsGuiFactory implements GuiAbstractFactory {
  @override
  StatusBar getStatusBar() {
    return WindowsStatusBar();
  }

  @override
  MainMenu getMainMenu() {
    return WindowsMainMenu();
  }

  @override
  MainWindow getMainWindow() {
    return WindowsMainWindow();
  }
}

//realization of the abstract factory for Linux
class LinuxGuiFactory implements GuiAbstractFactory {
  @override
  StatusBar getStatusBar() {
    return LinuxStatusBar();
  }

  @override
  MainMenu getMainMenu() {
    return LinuxMainMenu();
  }

  @override
  MainWindow getMainWindow() {
    return LinuxMainWindow();
  }
}

//client class for created GUI
enum TypeOS { Windows, Linux }

class Application {
  final GuiAbstractFactory guiFactory;
  // final MainWindow mainWindow;

  Application(this.guiFactory);

  void creareGui() {
    var mainwindow = guiFactory.getMainWindow()..create();
    var mainMenu = guiFactory.getMainMenu()..create();
    var statusBar = guiFactory.getStatusBar()..create();
    // do something yet
  }
}

class GuiFactory {
  static GuiAbstractFactory factory(TypeOS typeOS) {
    switch (typeOS) {
      case TypeOS.Windows:
        return WindowsGuiFactory();
      case TypeOS.Linux:
        return LinuxGuiFactory();
      default:
        throw ArgumentError();
    }
  }
}

void main(List<String> arguments) {
  var typeOS = TypeOS.Linux;
  var guiFactory = GuiFactory.factory(typeOS);
  var app = Application(guiFactory);
  app.creareGui();
}
