var tracker = require('delivery-tracker')
var courier = tracker.courier(tracker.COURIER.FEDEX.CODE)

tracker.courier
courier.trace({ number: '785938136802' }, function (err, result) {
    if(err) {
        console.log(err);
    }
    console.log(result)
}) 