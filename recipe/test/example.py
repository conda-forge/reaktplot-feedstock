from reaktplot import *

x = list(range(5))
y = [xi**2 for xi in x]

fig = Figure()

fig.title("SQUARE FUNCTION")

fig.xaxisTitle("x")
fig.yaxisTitle("y")

fig.drawLine(x, y, "x**2")

fig.save("xsquared.pdf")
