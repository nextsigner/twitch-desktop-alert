import QtQuick 2.12
Text{
    id: r
    font.family: webFont.name
    text: '<b>Texto</b>'
    font.pixelSize: app.fs*10
    width: 800
    wrapMode: Text.WordWrap
    //anchors.centerIn: parent

    NumberAnimation on x{
        id: anim
        running: true
        to: 0-r.width/2
        duration: 200
        easing.type: Easing.InOutBounce
        property int pix: 0-r.width/2
        onStopped: {
            if(anim.to===pix) { anim.from=pix; anim.to=pix-10; } else { anim.from=pix-10; anim.to=pix }
            start()
        }
    }
    NumberAnimation on y{
        id: anim2
        running: true
        to: 60
        duration: 200
        easing.type: Easing.InOutBounce
        onStopped: {
            if(anim2.to===60) { anim2.from=60; anim2.to=50; } else { anim2.from=50; anim2.to=60 }
            start()
        }
    }
    NumberAnimation on rotation{
        id: anim3
        running: true
        to: 5
        duration: 300
        easing.type: Easing.InOutBounce
        onStopped: {
            if(anim3.to===5) { anim3.from=5; anim3.to=-5; } else { anim3.from=-5; anim3.to=5 }
            start()
        }
    }
}
