#include <reaktplot/reaktplot.hpp>
using namespace reaktplot;

int main(int argc, char** argv)
{
    Array x = linspace(0.0, PI, 200);

    Figure fig;

    fig.title("SINE FUNCTION");

    fig.xaxisTitle("x");
    fig.yaxisTitle("y");

    fig.drawLine(x, Array(std::sin(1.0 * x)), "sin(x)");

    fig.save("sine.pdf");
}
