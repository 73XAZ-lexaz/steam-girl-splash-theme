import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia 5.15

Rectangle {
    id: root
    height: Screen.height
    width: Screen.width
    color: "black"

    Image {
        id: backgroundImage
        source: "images/start.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        visible: player.playbackState !== MediaPlayer.PlayingState
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectCrop
        source: player
    }

    Image {
        id: endImage
        source: "images/end.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        visible: player.status === MediaPlayer.EndOfMedia
    }

    MediaPlayer {
        id: player
        source: "video/steamgirl.mp4"
        autoPlay: true
        volume: 1.0

        onStatusChanged: {
            if (status === MediaPlayer.EndOfMedia) {
                console.log("Video finished")
            }
        }
    }
}
