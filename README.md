# react-native-geofences

Simple geofencing library for React Native. Supports currently only iOS.

## Getting started

`$ yarn add https://github.com/santervo/react-native-geofences.git`

## Usage

Adding geofence:

```javascript
import Geofences from "react-native-geofences";

Geofences.addGeofence({
  id: "Helsinki",
  latitude: 60.185745,
  longitude: 24.936266,
  radius: 150
});
```

Removing geofence:

```javascript
Geofences.removeGeofence("Helsinki");
```

Listening to geofence events:

```javascript
Geofences.onEnterRegion(id => console.log(`Enter region ${id}`));

Geofences.onExitRegion(id => console.log(`Exit region ${id}`));
```
