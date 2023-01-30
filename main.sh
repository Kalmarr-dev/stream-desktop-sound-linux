#!bin/bash


pactl load-module module-null-sink sink_name=sink_mix sink_properties=device.description=sink_mix

# to find input device name run "pactl list sources"
pactl load-module module-loopback latency_msec=60 adjust_time=6 source=<input_device> sink=sink_mix

# to find input device name run "pactl list sinks"
pactl load-module module-combine-sink slaves=<output_devise>,sink_mix


pavucontrol
# Here open Recording tab and change Discord's listener to "Monitor of sink_mix"
# Then in Playback tab change output of apps you want (such as Chrome) to "Simultaneous output (...)"
# Be careful not to output Discord sound to sink_mix, as this will create echo! (I think!)


# to revert changes run "pavucontrol -k", 
# NOTE that this will delete ALL custom things like sink_mix, if you have created any, and then restore defaults
