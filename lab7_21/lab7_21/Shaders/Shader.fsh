//
//  Shader.fsh
//  lab7_21
//
//  Created by robert on 4/28/17.
//  Copyright (c) 2017 di. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
