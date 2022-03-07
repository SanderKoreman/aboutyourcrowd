// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import grabHashtag from "../components/hashtag_show";
import { initHashtagIndex } from "../components/hashtag_index";


Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

// 1 CHARTS STAFF
// Passing score from Ruby

// Create root element
// https://www.amcharts.com/docs/v5/getting-started/#Root_element
if(document.getElementById("chartdiv")) {

  var score = document.getElementById("chartdiv").getAttribute("data-score");
  var root = am5.Root.new("chartdiv");


  // Set themes
  // https://www.amcharts.com/docs/v5/concepts/themes/
  root.setThemes([
    am5themes_Animated.new(root)
  ]);

  // Create chart
  // https://www.amcharts.com/docs/v5/charts/radar-chart/
  var chart = root.container.children.push(
    am5radar.RadarChart.new(root, {
      panX: false,
      panY: false,
      startAngle: 180,
      endAngle: 360
    })
  );

  chart.getNumberFormatter().set();

  // Create axis and its renderer
  // https://www.amcharts.com/docs/v5/charts/radar-chart/gauge-charts/#Axes
  var axisRenderer = am5radar.AxisRendererCircular.new(root, {
    innerRadius: -40
  });

  axisRenderer.grid.template.setAll({
    stroke: root.interfaceColors.get("background"),
    visible: true,
    strokeOpacity: 0.8
  });

  var xAxis = chart.xAxes.push(
    am5xy.ValueAxis.new(root, {
      maxDeviation: 0,
      min: 0,
      max: 9,
      strictMinMax: true,
      renderer: axisRenderer
    })
  );

  // Add clock hand
  // https://www.amcharts.com/docs/v5/charts/radar-chart/gauge-charts/#Clock_hands
  var axisDataItem = xAxis.makeDataItem({});

  var clockHand = am5radar.ClockHand.new(root, {
    pinRadius: 50,
    radius: am5.percent(100),
    innerRadius: 50,
    bottomWidth: 0,
    topWidth: 0
  });

  clockHand.pin.setAll({
    fillOpacity: 0,
    strokeOpacity: 0.5,
    stroke: am5.color(0x000000),
    strokeWidth: 1,
    strokeDasharray: [2, 2]
  });
  clockHand.hand.setAll({
    fillOpacity: 0,
    strokeOpacity: 0.5,
    stroke: am5.color(0x000000),
    strokeWidth: 0.5
  });

  var bullet = axisDataItem.set(
    "bullet",
    am5xy.AxisBullet.new(root, {
      sprite: clockHand
    })
  );

  xAxis.createAxisRange(axisDataItem);

  var label = chart.radarContainer.children.push(
    am5.Label.new(root, {
      centerX: am5.percent(50),
      textAlign: "center",
      centerY: am5.percent(50),
      fontSize: "1.5em"
    })
  );

  axisDataItem.set("value", 50);
  bullet.get("sprite").on("rotation", function () {
    var value = axisDataItem.get("value");
    label.set("text", score);
  });

  /* TUT */

    axisDataItem.animate({
      key: "value",
      to: score,
      duration: 500,
      easing: am5.ease.out(am5.ease.cubic)
    });
  /*
  setInterval(function () {
    var value = Math.round(Math.random() * 100);



    axisRange0.animate({
      key: "endValue",
      to: value,
      duration: 500,
      easing: am5.ease.out(am5.ease.cubic)
    });

    axisRange1.animate({
      key: "value",
      to: value,
      duration: 500,
      easing: am5.ease.out(am5.ease.cubic)
    });
  }, 2000);
  */

  chart.bulletsContainer.set("mask", undefined);



  var colorSet = am5.ColorSet.new(root, {});
  /* TUT */
  var axisRange0 = xAxis.createAxisRange(
    xAxis.makeDataItem({
      above: true,
      value: score,
      endValue: 9
    })
  );

  axisRange0.get("axisFill").setAll({
    visible: true,
    fill: colorSet.getIndex(0)
  });

  axisRange0.get("label").setAll({
    forceHidden: true
  });
  /* TUT */
  var axisRange1 = xAxis.createAxisRange(
    xAxis.makeDataItem({
      above: true,
      value: score,
      endValue: 0
    })
  );

  axisRange1.get("axisFill").setAll({
    visible: true,
    fill: colorSet.getIndex(4)
  });

  axisRange1.get("label").setAll({
    forceHidden: true
  });

  // Make stuff animate on load
  chart.appear(1000, 9);
  chart.svgContainer.autoResize = false;

}


document.addEventListener('turbolinks:load', () => {
  initHashtagIndex();
  grabHashtag();
});
