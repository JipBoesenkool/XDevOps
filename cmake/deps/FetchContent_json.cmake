include(FetchContent)

#settings
FetchContent_Declare(
    json
    QUIET
    GIT_REPOSITORY  https://github.com/nlohmann/json.git
    GIT_TAG         v3.12.0
    GIT_PROGRESS   TRUE
    EXCLUDE_FROM_ALL
)
FetchContent_MakeAvailable(json)
#set_target_properties(json::json PROPERTIES FOLDER libs/)
