require 'graphviz'
require 'graphviz/theory'

distances = GraphViz.digraph("G", rankdir: "LR") do |distance|
   distance.node[:shape] = "circle"

   distance.a[label: "0"]
   distance.b[label: "1"]
   distance.c[label: "2"]
   distance.d[label: "3"]
   distance.e[label: "4"]
   distance.f[label: "5"]
   distance.g[label: "6"]
   distance.h[label: "7"]

   (distance.a << distance.b)[weight: 10, label: "10"]
   (distance.b << distance.c)[weight: 4,  label: "4"]
   (distance.c << distance.d)[weight: 15, label: "15"]
   (distance.d << distance.h)[weight: 7,  label: "7"]
   (distance.a << distance.e)[weight: 15, label: "15"]
   (distance.e << distance.f)[weight: 8,  label: "8"]
   (distance.f << distance.h)[weight: 10, label: "10"]
   (distance.a << distance.g)[weight: 21, label: "21"]
   (distance.g << distance.h)[weight: 7,  label: "7"]
end

distances.output(png: "test.png")

r = GraphViz::Theory.new(distances).moore_dijkstra(distances.a, distances.h)

if r.nil?
  puts "No way !"
else
  puts "\tDistance : #{r[:distance]}"
end
