version = (((`/usr/bin/xcodebuild -version`.lines || []).first || "").split || []).last

puts version