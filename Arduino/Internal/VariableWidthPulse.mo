within Arduino.Internal;
block VariableWidthPulse "Generate pulse signal of type Real"
  parameter Real amplitude=1 "Amplitude of pulse";

  parameter Modelica.SIunits.Time period(final min=Modelica.Constants.small,
      start=1) "Time for one period";
  parameter Integer nperiod=-1
    "Number of periods (< 0 means infinite number of periods)";
  parameter Real offset=0 "Offset of output signals";
  parameter Modelica.SIunits.Time startTime=0
    "Output = offset for time < startTime";
  extends Modelica.Blocks.Interfaces.SO;

protected
  Modelica.SIunits.Time T_start "Start time of current period";
  Integer count "Period count";
public
  Modelica.Blocks.Interfaces.RealInput width
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
initial algorithm
  count := integer((time - startTime)/period);
  T_start := startTime + count*period;
equation
    when integer((time - startTime)/period) > pre(count) then
    count = pre(count) + 1;
    T_start = time;
  end when;
  y = offset + (if (time < startTime or nperiod == 0 or (nperiod > 0 and
    count >= nperiod)) then 0 else if time < T_start + (period*width/100) then amplitude
     else 0);
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
        Polygon(
          points={{90,-70},{68,-62},{68,-78},{90,-70}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,-70},{-40,-70},{-40,44},{0,44},{0,-70},{40,-70},{40,
              44},{79,44}}),
        Text(
          extent={{-147,-152},{153,-112}},
          lineColor={0,0,0},
          textString="period=%period")}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Polygon(
          points={{-80,90},{-85,68},{-75,68},{-80,90}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,68},{-80,-80}}, color={95,95,95}),
        Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
        Polygon(
          points={{90,-70},{68,-65},{68,-75},{90,-70}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-34,0},{-37,-13},{-31,-13},{-34,0}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Line(points={{-34,0},{-34,-70}},  color={95,95,95}),
        Polygon(
          points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-78,-24},{-35,-36}},
          lineColor={0,0,0},
          textString="offset"),
        Text(
          extent={{-30,-72},{16,-81}},
          lineColor={0,0,0},
          textString="startTime"),
        Text(
          extent={{-82,96},{-49,79}},
          lineColor={0,0,0},
          textString="y"),
        Text(
          extent={{66,-80},{87,-90}},
          lineColor={0,0,0},
          textString="time"),
        Line(points={{-10,0},{-10,-70}}, color={95,95,95}),
        Line(
          points={{-80,0},{-10,0},{-10,50},{30,50},{30,0},{50,0},{50,50},{90,
              50}},
          color={0,0,255},
          thickness=0.5),
        Line(points={{-10,88},{-10,50}}, color={95,95,95}),
        Line(points={{30,74},{30,50}}, color={95,95,95}),
        Line(points={{50,88},{50,50}}, color={95,95,95}),
        Line(points={{-10,83},{50,83}}, color={95,95,95}),
        Line(points={{-10,69},{30,69}}, color={95,95,95}),
        Text(
          extent={{-3,93},{39,84}},
          lineColor={0,0,0},
          textString="period"),
        Text(
          extent={{-7,78},{30,69}},
          lineColor={0,0,0},
          textString="width"),
        Line(points={{-43,50},{-10,50}}, color={95,95,95}),
        Line(points={{-34,50},{-34,0}}, color={95,95,95}),
        Text(
          extent={{-77,30},{-37,21}},
          lineColor={0,0,0},
          textString="amplitude"),
        Polygon(
          points={{-34,50},{-37,37},{-31,37},{-34,50}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-34,0},{-37,13},{-31,13},{-34,0},{-34,0}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Line(
          points={{90,50},{90,0},{100,0}},
          color={0,0,255},
          thickness=0.5),
        Polygon(
          points={{-10,69},{-1,71},{-1,67},{-10,69}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{30,69},{22,71},{22,67},{30,69}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-10,83},{-1,85},{-1,81},{-10,83}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{50,83},{42,85},{42,81},{50,83}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>
The Real output y is a pulse signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Pulse.png\"
     alt=\"Pulse.png\">
</p>
</html>"));
end VariableWidthPulse;
