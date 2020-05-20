class KinectSkeleton{

    // Create Kinect variables will be used in this class. 
    Kinect kinect;
    ArrayList <SkeletonData> bodies;

    //Initialize
    KinectSkeleton(){    

    }

    void draw (boolean isDrawSkeleton, Kinect kinect, ArrayList <SkeletonData> bodies){
        this.kinect = kinect;
        this.bodies = bodies;

        if (isDrawSkeleton){
            //Draw player bodies
            for (int i=0; i<bodies.size (); i++) 
            {
                drawSkeleton(bodies.get(i));
                drawPosition(bodies.get(i));
            }
        }
    }

    int getPosition (){
        if (bodies != null && bodies.size() > 0){
            //Searching for the bodies SPINE position
            for (int i=0; i<bodies.size (); i++) 
            { if(bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_SPINE].x > 0){
                //change main character's position on x axis
                int position = (int)(bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_SPINE].x*width);
                return position;
                }
            }
        }
        return 0;
    }

    // Draw Player Skeleton position as text
    void drawPosition(SkeletonData _s) 
    {
        noStroke();
        fill(0, 100, 255);
        String s1 = str(_s.dwTrackingID);
        text(s1, _s.position.x*width, _s.position.y*height);
    }

    // Draw Player Skeleton 
    void drawSkeleton(SkeletonData _s) 
    {
        // Body
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_HEAD, 
        Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
        Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
        Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
        Kinect.NUI_SKELETON_POSITION_SPINE);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
        Kinect.NUI_SKELETON_POSITION_SPINE);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
        Kinect.NUI_SKELETON_POSITION_SPINE);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_SPINE, 
        Kinect.NUI_SKELETON_POSITION_HIP_CENTER);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
        Kinect.NUI_SKELETON_POSITION_HIP_LEFT);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
        Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
        Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);

        // Left Arm
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
        Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, 
        Kinect.NUI_SKELETON_POSITION_WRIST_LEFT);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, 
        Kinect.NUI_SKELETON_POSITION_HAND_LEFT);

        // Right Arm
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
        Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, 
        Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, 
        Kinect.NUI_SKELETON_POSITION_HAND_RIGHT);

        // Left Leg
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
        Kinect.NUI_SKELETON_POSITION_KNEE_LEFT);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 
        Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT, 
        Kinect.NUI_SKELETON_POSITION_FOOT_LEFT);

        // Right Leg
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, 
        Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 
        Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT);
        DrawBone(_s, 
        Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT, 
        Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT);
    }

    // Draw the line between two points of the skeleton
    void DrawBone(SkeletonData _s, int _j1, int _j2) 
    {
    noFill();
    stroke(255, 0, 0);
    if (_s.skeletonPositionTrackingState[_j1] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
        _s.skeletonPositionTrackingState[_j2] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
        line(_s.skeletonPositions[_j1].x*width, 
        _s.skeletonPositions[_j1].y*height, 
        _s.skeletonPositions[_j2].x*width, 
        _s.skeletonPositions[_j2].y*height);
    }
    }
}