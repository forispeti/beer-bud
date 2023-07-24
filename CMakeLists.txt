cmake_minimum_required(VERSION 3.16)

project(tictactoe VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(tictactoe
    main.cpp
)

qt_policy(SET QTP0001 NEW)

qt_add_qml_module(tictactoe
    URI beer-bud
    VERSION 1.0
    QML_FILES Main.qml StartMenu.qml TicTacToe.qml TicTacToeComputer.js
    QML_FILES TextButton.qml
    RESOURCES Assets/Circle.png Assets/X.png
)

set_target_properties(tictactoe PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(tictactoe
    PRIVATE Qt6::Quick
)

install(TARGETS tictactoe
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
