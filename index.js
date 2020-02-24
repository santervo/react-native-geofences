import { NativeModules, NativeEventEmitter } from "react-native";

const { Geofences } = NativeModules;

const GeofenceEvents = new NativeEventEmitter(Geofences);

export default {
  addGeofence: Geofences.addGeofence,
  removeGeofence: Geofences.removeGeofence,
  onEnterRegion(listener) {
    GeofenceEvents.addListener("onEnterRegion", listener);
  },
  onExitRegion(listener) {
    GeofenceEvents.addListener("onExitRegion", listener);
  }
};
