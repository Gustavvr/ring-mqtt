const RingSocketDevice = require('./base-socket-device')

class Bridge extends RingSocketDevice {
    constructor(deviceInfo) {
        super(deviceInfo, 'commStatus')
        this.deviceData.mdl = 'Bridge'
        this.deviceData.name = this.device.location.name + ' Bridge'
    }

    publishData() {
        // This device only has attributes and attribute based entities
        this.publishAttributes()
    }
}

module.exports = Bridge