#include <print>
namespace plog {
template<class... Args >
void info(std::format_string<Args...> fmt, Args&&... args ) {
    std::print(fmt, std::forward<Args>(args)...);
}
}