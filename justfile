#!/usr/bin/env just --justfile

install-local: pack
    mkdir -p ~/.local-nuget/packages
    cp bin/Release/*.nupkg ~/.local-nuget/packages
    dotnet nuget locals global-packages --clear

pack:
    dotnet pack --configuration Release

add-source:
    dotnet nuget add source ~/.local-nuget/packages --name local-nuget

remove-source:
    dotnet nuget remove source local-nuget