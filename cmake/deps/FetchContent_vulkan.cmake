include(FetchContent)

# Declare required Vulkan version
set(VULKAN_VER_MAJOR 1)
set(VULKAN_VER_MINOR 4)
set(VULKAN_VER_PATCH 314)
set(VULKAN_VERSION ${VULKAN_VER_MAJOR}.${VULKAN_VER_MINOR}.${VULKAN_VER_PATCH})

#-------------------------------------------------------------------------
# Fetch Vulkan C Headers
# ------------------------------------------------------------------------
FetchContent_Declare(
  VulkanHeaders
  GIT_REPOSITORY https://github.com/KhronosGroup/Vulkan-Headers.git
  GIT_TAG v${VULKAN_VERSION}
  GIT_SHALLOW TRUE
  GIT_PROGRESS TRUE
)
FetchContent_MakeAvailable(VulkanHeaders) # vulkanheaders has a proper CMakeLists

#-------------------------------------------------------------------------
# Fetch Vulkan bootstrap
# ------------------------------------------------------------------------
FetchContent_Declare(
  vk-bootstrap
  GIT_REPOSITORY https://github.com/charles-lunarg/vk-bootstrap.git
  GIT_TAG v${VULKAN_VERSION}
  GIT_SHALLOW TRUE
  GIT_PROGRESS TRUE
)
FetchContent_MakeAvailable(vk-bootstrap)

#-------------------------------------------------------------------------
# Fetch Vulkan vma
# ------------------------------------------------------------------------
FetchContent_Declare(
  VulkanMemoryAllocator
  GIT_REPOSITORY https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git
  GIT_TAG v3.2.1
  GIT_SHALLOW TRUE
  GIT_PROGRESS TRUE
)
FetchContent_MakeAvailable(VulkanMemoryAllocator)