#include "DistanceSensor.h"

#include "Arduino.h"

DistanceSensor::DistanceSensor(int trigPin, int echoPin)
{
    _trigPin = trigPin;
    _echoPin = echoPin;
    _distance = 0;
    _duration = 0;

    pinMode(_trigPin, OUTPUT);
    pinMode(_echoPin, INPUT);
}

float DistanceSensor::getDistance()
{
    // gets distance in cm
    digitalWrite(_trigPin, LOW);
    delayMicroseconds(4);
    digitalWrite(_trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(_trigPin, LOW);

    _duration = pulseIn(_echoPin, HIGH); // si se aumenta el tiempo puede medir hasta 4m

    _distance = _duration / 58; // cm

    delay(1000); // 1s

    return _distance;
}

float DistanceSensor::convertCMtoM(float distance)
{
    return distance / 100;
}

float DistanceSensor::convertCMtoMM(float distance)
{
    return distance * 10;
}
