include(FetchContent)

# sdl2
FetchContent_Declare(
    SDL2
    QUIET
    GIT_REPOSITORY  https://github.com/libsdl-org/SDL
    GIT_TAG         release-2.30.9
    GIT_PROGRESS   TRUE
    EXCLUDE_FROM_ALL
)
# sdl2_image
FetchContent_Declare(
    SDL2_IMAGE
    QUIET
    GIT_REPOSITORY  https://github.com/libsdl-org/SDL_image
    GIT_TAG         release-2.8.2
    GIT_PROGRESS   TRUE
    EXCLUDE_FROM_ALL
)

# sdl2_ttf
FetchContent_Declare(
    SDL2_TTF
    QUIET
    GIT_REPOSITORY  https://github.com/libsdl-org/SDL_ttf.git
    GIT_TAG         release-2.22.0
    GIT_PROGRESS   TRUE
    EXCLUDE_FROM_ALL
)
FetchContent_MakeAvailable(SDL2 SDL2_IMAGE SDL2_TTF)

#TODO: Use OrganizeSolution.cmake
#organize msvc project
#SDL2
set_target_properties(SDL2 PROPERTIES FOLDER libs/SDL2/)
set_target_properties(SDL2main PROPERTIES FOLDER libs/SDL2/)
set_target_properties(sdl_headers_copy PROPERTIES FOLDER libs/SDL2/)
#SDL2_image
set_target_properties(SDL2_image PROPERTIES FOLDER libs/SDL2/)
#sdl2_ttf
set_target_properties(SDL2_ttf PROPERTIES FOLDER libs/SDL2/)
set_target_properties(freetype PROPERTIES FOLDER libs/SDL2/)