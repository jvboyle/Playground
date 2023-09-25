/*
 * D3 Graphing JS File
 * Partner with d3_wrap.css
 */


/* Histogram
 * Input: id(e.g., '#histogram'), [["Item1", <value>], ["Item2", <value>]], color code (e.g., "#807dba")
 */
function histoGram(id, fD, color) {
    var hG={}, hGDim = {t: 60, r: 0, b: 30, l: 0};
    hGDim.w = 1200 - hGDim.l - hGDim.r, 
    hGDim.h = 300 - hGDim.t - hGDim.b;
        
    var hGsvg = d3.select(id).append("svg")
        .attr("id", "histogram")
        .attr("width", hGDim.w + hGDim.l + hGDim.r)
        .attr("height", hGDim.h + hGDim.t + hGDim.b).append("g")
        .attr("transform", "translate(" + hGDim.l + "," + hGDim.t + ")");

    // create function for x-axis mapping.
    var x = d3.scale.ordinal().rangeRoundBands([0, hGDim.w], 0.1)
            .domain(fD.map(function(d) { return d[0]; }));

    // Add x-axis to the histogram svg.
    hGsvg.append("g").attr("class", "x axis")
        .attr("transform", "translate(0," + hGDim.h + ")")
        .call(d3.svg.axis().scale(x).orient("bottom"));

    // Create function for y-axis map.
    var y = d3.scale.linear().range([hGDim.h, 0])
            .domain([0, d3.max(fD, function(d) { return d[1]; })]);

    // Create bars for histogram to contain rectangles and freq labels.
    var bars = hGsvg.selectAll(".bar").data(fD).enter()
            .append("g").attr("class", "bar");
    
    //create the rectangles.
    bars.append("rect")
        .attr("x", function(d) { return x(d[0]); })
        .attr("y", function(d) { return y(d[1]); })
        .attr("width", x.rangeBand())
        .attr("height", function(d) { return hGDim.h - y(d[1]); })
        .attr('fill',color)
        //.on("mouseover",mouseover)// mouseover is defined below.
        //.on("mouseout",mouseout);// mouseout is defined below.
        
    //Create the frequency labels above the rectangles.
    bars.append("text").text(function(d){ return d3.format(",")(d[1])})
        .attr("x", function(d) { return x(d[0])+x.rangeBand()/2; })
        .attr("y", function(d) { return y(d[1])-5; })
        .attr("text-anchor", "middle");
    
    return hGsvg;
}

/* Pie Chart (Including Legend) TODO
 * Input: 
 *     id = (e.g., '#histogram')
 *     pD = [{type: "Item1", freq:50}, {type: "Item2", freq:50}]
 *     segColor = {"Windows":"#807dba", "Linux":"#e08214", AIX:"#41ab5d"}
 */
function pieChart(id, pD, segColor, mouseover) {

    // XXX - Pie Chart
    var pC ={},    pieDim ={w:250, h: 250};
    pieDim.r = Math.min(pieDim.w, pieDim.h) / 2;
            
    // create svg for pie chart.
    var piesvg = d3.select(id).append("svg")
        .attr("width", pieDim.w).attr("height", pieDim.h).append("g")
        .attr("transform", "translate("+pieDim.w/2+","+pieDim.h/2+")");
    
    // create function to draw the arcs of the pie slices.
    var arc = d3.svg.arc().outerRadius(pieDim.r - 10).innerRadius(0);

    // create a function to compute the pie slice angles.
    var pie = d3.layout.pie().sort(null).value(function(d) { return d.freq; });

    // Draw the pie slices.
    if ( mouseover == undefined ) {
        piesvg.selectAll("path").data(pie(pD)).enter().append("path").attr("d", arc)
            .each(function(d) { this._current = d; })
            .style("fill", function(d) { return segColor[d.data.type]; })
            .on("mouseover",mouseover);
            //.on("mouseout",mouseout);
    } else {
        piesvg.selectAll("path").data(pie(pD)).enter().append("path").attr("d", arc)
            .each(function(d) { this._current = d; })
            .style("fill", function(d) { return segColor[d.data.type]; })
            .on("mouseover",mouseover);
    }

    // create function to update pie-chart. This will be used by histogram.
    pC.update = function(nD){
        piesvg.selectAll("path").data(pie(nD)).transition().duration(500)
            .attrTween("d", arcTween);
    }        

    // Animating the pie-slice requiring a custom function which specifies
    // how the intermediate paths should be drawn.
    function arcTween(a) {
        var i = d3.interpolate(this._current, a);
        this._current = i(0);
        return function(t) { return arc(i(t)); };
    }

    // XXX - LEGEND
    var leg = {}

    // create table for legend.
    var legend = d3.select(id).append("table").attr('class','legend');
    
    // create one row per segment.
    var tr = legend.append("tbody").selectAll("tr").data(pD).enter().append("tr");
        
    // create the first column for each segment.
    tr.append("td").append("svg").attr("width", '16').attr("height", '16').append("rect")
        .attr("width", '16').attr("height", '16')
        .attr("fill",function(d){ return segColor[d.type]; });
        
    // create the second column for each segment.
    tr.append("td").text(function(d){ return d.type;});

    // create the third column for each segment.
    //tr.append("td").attr("class",'legendFreq')
    //    .text(function(d){ return d3.format(",")(d.freq);});

    // create the fourth column for each segment.
    tr.append("td").attr("class",'legendPerc')
        .text(function(d){ return getLegend(d,pD);});

    // Utility function to be used to update the legend.
    leg.update = function(nD){
        // update the data attached to the row elements.
        var l = legend.select("tbody").selectAll("tr").data(nD);

        // update the frequencies.
        l.select(".legendFreq").text(function(d){ return d3.format(",")(d.freq);});

        // update the percentage column.
        l.select(".legendPerc").text(function(d){ return getLegend(d,nD);});        
    }
    
    function getLegend(d,aD){ // Utility function to compute percentage.
        return d3.format("%")(d.freq/d3.sum(aD.map(function(v){ return v.freq; })));
    }

    return piesvg;
}

/*
 * progressBar
 */
function progressBar(id, percent) {
    $(id).append('<div class="progress progress-striped active"> <div class="bar" style="width:' + percent + '%;"></div><p><b>&nbsp;' + percent + '%</b></p></div>');
}

/* Pie + Histogram Chart
 * Windows_version = [["2008", 12], ["2012", 22]];
 * Linux_version = [["2.2.2", 44], ["3.3.3", 33], ["4.4.4", 33]];
 * hD['Windows'] = Windows_version;
 * hD['Linux'] = Linux_version;
 * color = {"Windows":"#807dba", "Linux":"#e08214", "AIX":"#41ab5d"}
 * pD = [{type: "Windows", freq:50}, {type: "Linux", freq:50}];
 */
function pieHistogramChart(id, pH, pD, segColor) {
    function mouseover(d){
        //create svg for histogram.
        d3.select(id).select("#histogram").remove();
        histoGram(id, pH[d.data.type], segColor[d.data.type]);
    }

    var pie = pieChart(id, pD, segColor, mouseover);
    for (var firstKey in segColor) break;

    hist = histoGram(id, pH[firstKey], segColor[firstKey]);
}

function legend(id, lD, segColor) {
    var leg = {};
        
    // create table for legend.
    var legend = d3.select(id).append("table").attr('class','legend');
    
    // create one row per segment.
    var tr = legend.append("tbody").selectAll("tr").data(lD).enter().append("tr");
        
    // create the first column for each segment.
    tr.append("td").append("svg").attr("width", '16').attr("height", '16').append("rect")
        .attr("width", '16').attr("height", '16')
        .attr("fill",function(d){ return segColor[d.type]; });
        
    // create the second column for each segment.
    tr.append("td").text(function(d){ return d.type;});

    // create the third column for each segment.
    //tr.append("td").attr("class",'legendFreq')
    //    .text(function(d){ return d3.format(",")(d.freq);});

    // create the fourth column for each segment.
    tr.append("td").attr("class",'legendPerc')
        .text(function(d){ return getLegend(d,lD);});

    // Utility function to be used to update the legend.
    leg.update = function(nD){
        // update the data attached to the row elements.
        var l = legend.select("tbody").selectAll("tr").data(nD);

        // update the frequencies.
        l.select(".legendFreq").text(function(d){ return d3.format(",")(d.freq);});

        // update the percentage column.
        l.select(".legendPerc").text(function(d){ return getLegend(d,nD);});        
    }
    
    function getLegend(d,aD){ // Utility function to compute percentage.
        return d3.format("%")(d.freq/d3.sum(aD.map(function(v){ return v.freq; })));
    }

    return leg;
}

/*
 * Line Graph
 * Input:
 *    id: tag id
 *    data: [1, 2, 3, 4]
 *    y_max: max value, otherwise 100
 *    dividen: y value normalization
 */
function lineGraph(id, data, y_max, dividen, x_axis_title, y_axis_title) {
    // define dimensions of graph
    var m = [10, 40, 40, 50]; // top, right, bottom, left
    var w = 520 - m[1] - m[3]; // width
        h = 200 - m[0] - m[2]; // height

    // default value
    if ( dividen == 0 ) {
        dividen = 1;
    }

    if ( y_max == 0 ) {
        y_max = 100;
    } else {
        y_max /= dividen;
    }
    
    // create a simple data array that we'll plot with a line (this array represents only the Y values, X will just be the index location)
    //var data = [3, 6, 2, 7, 5, 2, 0, 3, 8, 9, 2, 5, 9, 3, 6, 3, 6, 2, 7, 5, 2, 1, 3, 8, 9, 2, 5, 9, 2, 7];

    // X scale will fit all values from data[] within pixels 0-w
    var x = d3.scale.linear().domain([0, data.length]).range([0, w]);
    // Y scale will fit values from 0-10 within pixels h-0 (Note the inverted domain for the y-scale: bigger is up!)
    var y = d3.scale.linear().domain([0, y_max]).range([h, 0]);
    // automatically determining max range can work something like this
    // var y = d3.scale.linear().domain([0, d3.max(data)]).range([h, 0]);

    // create a line function that can convert data[] into x and y points
    var line = d3.svg.line()
        // assign the X function to plot our line as we wish
        .x(function(d,i) { 
            // verbose logging to show what's actually being done
            //console.log('Plotting X value for data point: ' + d + ' using index: ' + i + ' to be at: ' + x(i) + ' using our xScale.');
            // return the X coordinate where we want to plot this datapoint
            return x(i); 
        })
        .y(function(d) { 
            // verbose logging to show what's actually being done
            //console.log('Plotting Y value for data point: ' + d + ' to be at: ' + y(d) + " using our yScale.");
            // return the Y coordinate where we want to plot this datapoint
            return y(d / dividen); 
        })

    // Add an SVG element with the desired dimensions and margin.
    var graph = d3.select(id).append("svg:svg")
            .attr("width", w + m[1] + m[3])
            .attr("height", h + m[0] + m[2])
        .append("svg:g")
            .attr("transform", "translate(" + m[3] + "," + m[0] + ")");

    // create yAxis
    var xAxis = d3.svg.axis().scale(x).tickSize(-h).tickSubdivide(true);
    // Add the x-axis.
    graph.append("svg:g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + h + ")")
            .call(xAxis)
        .append("text")
            .attr("transform", "translate(10, 5)")
            .attr("y", 6)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text(x_axis_title);

    // create left yAxis
    var yAxisLeft = d3.svg.axis().scale(y).ticks(5).orient("left");
    // Add the y-axis to the left
    graph.append("svg:g")
            .attr("class", "y axis")
            .attr("transform", "translate(-15,0)")
            .call(yAxisLeft)
        .append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", 6)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text(y_axis_title);
    
    // Add the line by appending an svg:path element with the data line we created above
    // do this AFTER the axes above so that the line is above the tick-lines
    graph.append("svg:path").attr("d", line(data));
}

/*
 * Multiple Line Graph
 * Input:
 *    id: tag id
 *    data: [[1, 2], [2, 3], [4, 5]]
 *    y_max: max value, otherwise 100
 *    dividen: y value normalization
 */
function multipleLineGraph(id, data, y_max, dividen, x_axis_title, y_axis_title) {
    var margin = {top: 10, right: 40, bottom: 40, left: 50},
        width = 520 - margin.left - margin.right,
        height = 200 - margin.top - margin.bottom;

    // default value
    if ( dividen == 0 ) {
        dividen = 1;
    }

    if ( y_max == 0 ) {
        y_max = 100;
    } else {
        y_max /= dividen;
    }

    var parseDate = d3.time.format("%Y%m%d").parse;

    var x = d3.time.scale()
        .range([0, width]);

    var y = d3.scale.linear()
        .range([height, 0]);

    var color = d3.scale.category10();

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom");

    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left");

    var line = d3.svg.line()
        .interpolate("basis")
        .x(function(d) { return x(d.date); })
        .y(function(d) { return y(d.temperature); });

    var svg = d3.select("body").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    // TODO - need modification to get just data...
    color.domain(d3.keys(data[0]).filter(function(key) { return key !== "date"; }));

    data.forEach(function(d) {
        d.date = parseDate(d.date);
    });

    var cities = color.domain().map(function(name) {
        return {
        name: name,
        values: data.map(function(d) {
            return {date: d.date, temperature: +d[name]};
        })
        };
    });

    x.domain(d3.extent(data, function(d) { return d.date; }));

    y.domain([
        d3.min(cities, function(c) { return d3.min(c.values, function(v) { return v.temperature; }); }),
        d3.max(cities, function(c) { return d3.max(c.values, function(v) { return v.temperature; }); })
    ]);

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis)
        .append("text")
            .attr("transform", "translate(10, 5)")
            .attr("y", 6)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text(x_axis_title);

    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)
        .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("dy", ".71em")
        .style("text-anchor", "end")
        .text(y_axis_title)

    var city = svg.selectAll(".city")
        .data(cities)
        .enter().append("g")
        .attr("class", "city");

    city.append("path")
        .attr("class", "line")
        .attr("d", function(d) { return line(d.values); })
        .style("stroke", function(d) { return color(d.name); });

    city.append("text")
        .datum(function(d) { return {name: d.name, value: d.values[d.values.length - 1]}; })
        .attr("transform", function(d) { return "translate(" + x(d.value.date) + "," + y(d.value.temperature) + ")"; })
        .attr("x", 3)
        .attr("dy", ".35em")
        .text(function(d) { return d.name; });
}

/*
 * Labeled Force Layout
 * Input:
 *     data: {"nodes": [{"name":"Myriel","group":1},{"name":"Napoleon","group":1}, {"name":"Mlle.Baptistine","group":1}],
 *            "links": [{"source":0,"target":1,"value":1},{"source":1,"target":2,"value":8},{"source":2,"target":0,"value":10}]}
 */
function dependencyGraph(id, json, w, h, dataset, click_func, img_file, img_file_click) {
    var width = w, height =h 

    var svg = d3.select(id).append("svg")
        .attr("width", width)
        .attr("height", height);

    var force = d3.layout.force()
        .gravity(.05)
        .distance(100)
        .charge(-100)
        .size([width, height]);

    // when the data is json file...
    //d3.json(data, function(error, json) {
        force
            .nodes(json.nodes)
            .links(json.links)
            .start();

        var link = svg.selectAll(".link")
            .data(json.links)
            .enter().append("line")
            .attr("class", "link");

        var node = svg.selectAll(".node")
            .data(json.nodes)
            .enter().append("g")
            .attr("class", "node")
            .call(force.drag);

        function idstr(name) { return name.replace(/\.| |-/g,''); }

        if ( img_file == undefined ) {
            node.append("svg:circle")
                .attr("r", 7)
                .style("fill", "#555")
                .style("stroke", "#FFF")
                .style("stroke-width", 3);
        } else {
            node.append("image")
                .attr("xlink:href", img_file)
                .attr("x", -8)
                .attr("y", -8)
                .attr("width", 16)
                .attr("height", 16)
                .attr("id", function(d) { return idstr(d.name); })
                .on("mouseover", mouseover)
                .on("mouseout", mouseout)
                .on("click", mouseclick);

            // TODO - show information about this machine
            function mouseclick(d) {
                click_func(dataset, d.name);
                //alert("will show information about " + d.name);
            }

            function mouseover(d) {
                d3.select('#' + idstr(d.name)).attr("xlink:href", img_file_click);
            }

            function mouseout(d) {
                d3.select('#' + idstr(d.name)).attr("xlink:href", img_file);
            }
        }

        // TODO - text size can be adjusted here
        node.append("text")
            .attr("dx", 10)
            .attr("dy", ".35em")
            .text(function(d) { return d.name });

        force.on("tick", function() {
            link.attr("x1", function(d) { return d.source.x; })
                .attr("y1", function(d) { return d.source.y; })
                .attr("x2", function(d) { return d.target.x; })
                .attr("y2", function(d) { return d.target.y; });

            node.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
        })
    //})
}

/*
 * Input:
 * data = [{"CPU": 1.0, "MEM": 4089.14670659},{"CPU": 1.04116766467, "MEM": 280.673652695},{"CPU": 1.0, "MEM": 1.0},{"CPU": 1.32343234323, "MEM": 2331.12275449},{"CPU": 2.06923652695, "MEM": 2470.91317365},{"CPU": 1.85628742515, "MEM": 544.471556886},{"CPU": 2.31314741036, "MEM": 1227.45508982},{"CPU": 3.60634028892, "MEM": 1887.71428571},{"CPU": 0.677395209581, "MEM": 94400.0},{"CPU": 0.0499243570348, "MEM": 378.0},{"CPU": 7.31137724551, "MEM": 5570.0},{"CPU": 1.0, "MEM": 1.0},{"CPU": 1.69311377246, "MEM": 1239.98502994},{"CPU": 1.0, "MEM": 1.0},{"CPU": 3.84206586826, "MEM": 2057.30538922},{"CPU": 0.262481089259, "MEM": 617.353293413},{"CPU": 9.51721556886, "MEM": 460.865269461},{"CPU": 0.195359281437, "MEM": 332.377245509},{"CPU": 0.479790419162, "MEM": 210000.0},{"CPU": 0.146636432351, "MEM": 262000.0},{"CPU": 1.0, "MEM": 1.0},{"CPU": 0.214389534884, "MEM": 175.520348837},{"CPU": 1.0, "MEM": 1.0},{"CPU": 1.0, "MEM": 1.0},{"CPU": 1.0, "MEM": 1.0},{"CPU": 1.67814371257, "MEM": 1680.0748503},{"CPU": 1.0, "MEM": 1.0},{"CPU": 1.0, "MEM": 1.0},{"CPU": 7.57934131737, "MEM": 1879.58083832},{"CPU": 1.7416918429, "MEM": 1393.23353293},{"CPU": 1.20619335347, "MEM": 1640.23952096},{"CPU": 0.685628742515, "MEM": 425.456586826},{"CPU": 1.10388401171, "MEM": 19001.3473054},{"CPU": 1.0, "MEM": 1.0},{"CPU": 1.0, "MEM": 1.0},]
 * xstr = "CPU", ystr = "MEM"
 */

function scatterGraph(id, w, h, data, xstr, xlabel, ystr, ylabel) {
    var margin = {top: 20, right: 20, bottom: 30, left: 40},
        width = w - margin.left - margin.right,
        height = h - margin.top - margin.bottom;

    var x = d3.scale.linear()
        .range([0, width]);

    var y = d3.scale.linear()
        .range([height, 0]);

    var color = d3.scale.category10();

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom");

    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left");

    var svg = d3.select(id).append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
    .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    //d3.tsv("data.tsv", function(error, data) {

    data.forEach(function(d) {
        //d.sepalLength = +d.sepalLength;
        //d.sepalWidth = +d.sepalWidth;

        d[xstr] = +d[xstr];
        d[ystr] = +d[ystr];
    });

    x.domain(d3.extent(data, function(d) { return d[xstr]; })).nice();
    y.domain(d3.extent(data, function(d) { return d[ystr]; })).nice();

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis)
        .append("text")
        .attr("class", "label")
        .attr("x", width)
        .attr("y", -6)
        .style("text-anchor", "end")
        .text(xlabel);

    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)
        .append("text")
        .attr("class", "label")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("dy", ".71em")
        .style("text-anchor", "end")
        .text(ylabel)

    svg.selectAll(".dot")
        .data(data)
        .enter().append("circle")
        .attr("class", "dot")
        .attr("r", 3.5)
        .attr("cx", function(d) { return x(d[xstr]); })
        .attr("cy", function(d) { return y(d[ystr]); })
        .style("fill", function(d) { return color("black"); })
        .on("mouseover", function(d) { alert(d.name) } );

    /*
    var legend = svg.selectAll(".legend")
        .data(color.domain())
        .enter().append("g")
        .attr("class", "legend")
        .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

    legend.append("rect")
        .attr("x", width - 18)
        .attr("width", 18)
        .attr("height", 18)
        .style("fill", color);

    legend.append("text")
        .attr("x", width - 24)
        .attr("y", 9)
        .attr("dy", ".35em")
        .style("text-anchor", "end")
        .text(function(d) { return d; });
    */

    //});

}

// just keep this for learning purposes
// randomly generated graph...
function org_dependencyGraph() {
    //var w = 600, h = 400;
    var w = 960, h = 800;

    var labelDistance = 0;

    //var vis = d3.select("#modal_topology").append("svg:svg").attr("width", w).attr("height", h);
    var vis = d3.select("#topology").append("svg:svg").attr("width", w).attr("height", h);

    var nodes = [];
    var labelAnchors = [];
    var labelAnchorLinks = [];
    var links = [];

    // nodes = [ {label: "name"}, ...]
    // labelAnchors = [ {node: <node object>} ]
    // links = [ {source: <node index>, target: <node index>, weight: <value>}, ...]
    // labelAnchorLinks = [ {source: <node index>, target: <node index + 1>, weight: 1} ]

    // TODO - replace this part with custom data
    for(var i = 0; i < 100; i++) {
            var node = {
                    label : "node " + i
            };
            nodes.push(node);
            labelAnchors.push({
                    node : node
            });
            labelAnchors.push({
                    node : node
            });
    };

    for(var i = 0; i < nodes.length; i++) {
            for(var j = 0; j < i; j++) {
                    if(Math.random() > .95)
                            links.push({
                                    source : i,
                                    target : j,
                                    weight : Math.random()
                            });
            }
            labelAnchorLinks.push({
                    source : i * 2,
                    target : i * 2 + 1,
                    weight : 0.1
            });
    };
    // TODO -------

    var force = d3.layout.force().size([w, h]).nodes(nodes).links(links).gravity(3).linkDistance(50).charge(-3000).linkStrength(function(x) {
            return x.weight * 10
    });
    force.start();

    var force2 = d3.layout.force().nodes(labelAnchors).links(labelAnchorLinks).gravity(0).linkDistance(0).linkStrength(8).charge(-100).size([w, h]);
    force2.start();

    var link = vis.selectAll("line.link").data(links).enter().append("svg:line").attr("class", "link").style("stroke", "#CCC"); // TODO - chane this color

    var node = vis.selectAll("g.node").data(force.nodes()).enter().append("svg:g").attr("class", "node");
    node.append("svg:circle").attr("r", 7).style("fill", "#555").style("stroke", "#FFF").style("stroke-width", 3).on("click", mouseclick); 

    // TODO - this function needs to be out....
    function mouseclick(d) { alert("test: " + d.label); }

    node.call(force.drag);

    var anchorLink = vis.selectAll("line.anchorLink").data(labelAnchorLinks)//.enter().append("svg:line").attr("class", "anchorLink").style("stroke", "#999");

    var anchorNode = vis.selectAll("g.anchorNode").data(force2.nodes()).enter().append("svg:g").attr("class", "anchorNode");
    anchorNode.append("svg:circle").attr("r", 0).style("fill", "#FFF");
            anchorNode.append("svg:text").text(function(d, i) {
            return i % 2 == 0 ? "" : d.node.label
    }).style("fill", "#555").style("font-family", "Arial").style("font-size", 12);

    var updateLink = function() {
            this.attr("x1", function(d) {
                    return d.source.x;
            }).attr("y1", function(d) {
                    return d.source.y;
            }).attr("x2", function(d) {
                    return d.target.x;
            }).attr("y2", function(d) {
                    return d.target.y;
            });

    }

    var updateNode = function() {
            this.attr("transform", function(d) {
                    return "translate(" + d.x + "," + d.y + ")";
            });

    }

    // just use the contents... then it will not move if needed
    force.on("tick", function() {
            //force2.start(); // ??

            node.call(updateNode);

            anchorNode.each(function(d, i) {
                    if(i % 2 == 0) {
                            d.x = d.node.x;
                            d.y = d.node.y;
                    } else {
                            var b = this.childNodes[1].getBBox();

                            var diffX = d.x - d.node.x;
                            var diffY = d.y - d.node.y;

                            var dist = Math.sqrt(diffX * diffX + diffY * diffY);

                            var shiftX = b.width * (diffX - dist) / (dist * 2);
                            shiftX = Math.max(-b.width, Math.min(0, shiftX));
                            var shiftY = 1;
                            this.childNodes[1].setAttribute("transform", "translate(" + shiftX + "," + shiftY + ")");
                    }
            });

            anchorNode.call(updateNode);

            link.call(updateLink);
            anchorLink.call(updateLink);
    });
}

