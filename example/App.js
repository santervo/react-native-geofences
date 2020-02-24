import React, {Component, useEffect, useState} from 'react';
import {ScrollView, Text, SafeAreaView} from 'react-native';
import Geofences from 'react-native-geofences';
import sites from './sites';

export default props => {
  const [events, updateEvents] = useState([]);

  useEffect(() => {
    console.log('INIT');
    
    Geofences.onEnterRegion(regionId => {
      updateEvents(events => [...events, `ENTER ${regionId}`]);
    });

    Geofences.onExitRegion(regionId => {
      updateEvents(events => [...events, `EXIT ${regionId}`]);
    });

    sites.forEach(({name, position: {latitude, longitude}}) =>
      Geofences.addGeofence({id: name, latitude, longitude, radius: 50.0}),
    );
  }, []);

  return (
    <SafeAreaView>
      <ScrollView>
        {events.map((event, index) => (
          <Text key={index}>{event}</Text>
        ))}
      </ScrollView>
    </SafeAreaView>
  );
};
