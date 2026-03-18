import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia 5.15

Rectangle {
    id: root
    height: Screen.height
    width: Screen.width
    color: "black"

// This images loads the first frame of the video, so that we don't have a blank screen while the video is loading. It will be hidden once the video starts playing.
    Image {
        id: backgroundImage
        source: "images/start.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
// This prevents the 16:10 picture from being stretched to fit the 16:9 screen, and instead crops it to fill the screen while maintaining its aspect ratio.
        visible: player.playbackState !== MediaPlayer.PlayingState
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectCrop
        source: player
    }
// This image is used to cover the video output once the video ends, so that we don't have a blank screen after the video finishes playing. It will be hidden while the video is playing.
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
