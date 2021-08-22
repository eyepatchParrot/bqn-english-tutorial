#include <limits>
#include <cmath>
#include <iostream>
#include <fstream>
#include <vector>
#include "geometry.h"

struct Sphere {
    Vec3f center;
    double radius;
};

template<class T> auto square(T x) { return x*x; } 
template<class F> auto v(size_t width, size_t height, F&& f) -> std::vector<decltype(f(0,0))> {
    using T = decltype(f(0,0));
    std::vector<T> rv(width * height);
    for (size_t j=0; j<height; ++j) for (size_t i=0; i<width; ++i) rv[i+j*width] = f(i,j);
    return rv;
}


template<class T> auto d(const char * label, const std::vector<T>& xs) {
    std::cout << label;
    for (auto x : xs) std::cout << ' ' << x;
    std::cout << '\n';
    return xs;
}

void render(const Sphere &sphere) {
    //const int width    = 1024, height   = 768;
    const int width    = 10, height   = 7;
    const double widthf = width, heightf = height;
    const double fov      = M_PI/2.;
    Vec3f color_is_fg[2] = {
        Vec3f(0.2, 0.7, 0.8),
        Vec3f(0.4, 0.4, 0.3),
    };
    const Vec3f L = sphere.center - Vec3f(0,0,0); // orig

    auto xs = d("xs", v(width, height, [&](int i, int j) { return                         2*(i + 0.5)/widthf  - 1                                                                  ; }));
    auto ys = d("ys", v(width, height, [&](int i, int j) { return                         -(2*(j + 0.5)/heightf  - 1)                                                              ; }));
    auto xs1 = d("xs1", v(width, height, [&](int i, int j) { return                       xs[i+j*width]*tan(fov/2.)*width/heightf                                                  ; }));
    auto ys1 = d("ys1", v(width, height, [&](int i, int j) { return                       ys[i+j*width]*tan(fov/2.)                                                                ; }));
    auto dirs_denorm = d("dirs_denorm", v(width, height, [&](int i, int j) { return       Vec3f(xs[i+j*width], ys[i+j*width], -1)                                                  ; }));
    auto dirs_norm = d("dirs_norm", v(width, height, [&](int i, int j) { return           1./std::sqrt(square(dirs_denorm[i+j*width]))                                             ; }));
    auto dirs = d("dirs", v(width, height, [&](int i, int j) { return                     dirs_denorm[i+j*width] * dirs_norm[i+j*width]                                            ; }));
    auto tcas = d("tcas", v(width, height, [&](int i, int j) { return                     L * dirs[i+j*width]                                                                      ; }));
    auto d2s = d("d2s", v(width, height, [&](int i, int j) { return                       square(L) - square(tcas[i+j*width])                                                      ; }));
    auto thcs = d("thcs", v(width, height, [&](int i, int j) { return                     sqrtf(square(sphere.radius) - d2s[i+j*width])                                            ; }));
    auto t0s = d("t0s", v(width, height, [&](int i, int j) { return                       tcas[i+j*width] - thcs[i+j*width]                                                        ; }));
    auto t1s = d("t1s", v(width, height, [&](int i, int j) { return                       tcas[i+j*width] + thcs[i+j*width]                                                        ; }));
    auto ray_intersects = d("ray_intersects", v(width, height, [&](int i, int j) { return not (d2s[i+j*width] > square(sphere.radius) or t0s[i+j*width] < 0 or t1s[i+j*width] < 0) ; }));
    auto framebuffer = d("framebuffer", v(width ,height, [&](int i, int j) { return       color_is_fg[ray_intersects[i+j*width]]                                                   ; }));

    std::ofstream ofs; // save the framebuffer to file
    ofs.open("./out.ppm");
    ofs << "P6\n" << width << " " << height << "\n255\n";
    for (size_t i = 0; i < height*width; ++i) for (size_t j = 0; j<3; j++) ofs << (char)(255 * std::max(0., std::min(1., framebuffer[i][j])));
    ofs.close();
}

int main() {
    Sphere sphere{Vec3f(-3, 0, -16), 2};
    render(sphere);

    return 0;
}

