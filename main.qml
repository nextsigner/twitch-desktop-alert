import QtQuick 2.7
import QtQuick.Controls 2.0
import QtMultimedia 5.0

ApplicationWindow{
    id:app
    visible: true
    visibility: "Maximized"
    property int fs: xApp.width*0.02
    //FontLoader { id: webFont; name: "Pozofour";source: "./Pozofour.ttf" }
    FontLoader { id: webFont; name: "Asman";source: "./Asman.ttf" }
    MediaPlayer{
        id: mp
        autoLoad: true
        autoPlay: true
    }
    Item{
        id: xApp
        anchors.fill: parent
        Emisor{
            anchors.centerIn: parent
            //anchors.fill: parent
        }
        MouseArea{
            anchors.fill: parent
            onDoubleClicked: Qt.quit()
        }
    }
    Column{
        anchors.centerIn: parent
        spacing: app.fs*2
        Item{
            width: 1
            height: texto.contentHeight
            TextShaker{
                id: texto
                font.family: webFont.name
                text: '<b>NickName</b>'
                font.pixelSize: app.fs*10
                width: 800
            }
        }
        Item{
            width: 1
            height: texto2.contentHeight
            TextShaker{
                id: texto2
                font.family: webFont.name
                text: '<b>Event</b>'
                font.pixelSize: app.fs*5
                width: xApp.width*0.8
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
    Timer{
        id: timerQuit
        running: true
        interval: 20000
        onTriggered: {
            Qt.quit()
        }
    }
    Shortcut{
        sequence: 'Esc'
        onActivated: Qt.quit()
    }
    Component.onCompleted: {
        var urlSound='./sounds/happy_1.wav'
        var args = {}
        args.nickName='null'
        args.event='null'
        for(var i=0;i<Qt.application.arguments.length;i++){
            if(Qt.application.arguments[i].indexOf('=')>=0&&(Qt.application.arguments[i].indexOf('nickName=')>=0||Qt.application.arguments[i].indexOf('event=')>=0)){
                let d=Qt.application.arguments[i].split('=')
                let a=d[1]
                if(Qt.application.arguments[i].indexOf('nickName=')>=0){
                    args.nickName=a
                }
                if(Qt.application.arguments[i].indexOf('event=')>=0){
                    args.event=a
                }
            }
        }
        console.log('NickName: '+args.nickName)
        console.log('Event: '+args.event)
        if(args.nickName!=='null'){
            texto.text=args.nickName
        }
        if(args.event!=='null'){
            if(args.event==='follow'){
                texto2.text='ahora te SIGUE!'
            }
            if(args.event==='host'){
                texto2.text='te ha HOSTEADO!'
                urlSound='./sounds/happy_2.wav'
            }
            if(args.event==='raid'){
                texto2.text='te tiró un RAID!'
                urlSound='./sounds/happy_1.wav'
            }
            if(args.event==='donation'){
                texto2.text='te ha DONADO!'
                urlSound='./sounds/happy_2.wav'
            }
        }
        mp.source=urlSound
        mp.play()
    }
}
