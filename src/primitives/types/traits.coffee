Types = require './types'

Traits =
  node:
    id:                Types.nullable(Types.string())
    classes:           Types.classes()

  entity:
    active:            Types.bool(true)

  object:
    visible:           Types.bool(true)

  unit:
    scale:             Types.nullable(Types.number())
    fov:               Types.nullable(Types.number())
    focus:             Types.number(1)

  span:
    range:             Types.nullable(Types.vec2(-1, 1))
  view:
    range:             Types.array(Types.vec2(-1, 1), 4)
  view3:
    position:          Types.vec3()
    rotation:          Types.quat()
    scale:             Types.vec3(1, 1, 1)
  view4:
    position:          Types.vec4()
    scale:             Types.vec4(1, 1, 1, 1)

  vertex:
    pass:              Types.vertexPass()
    shader:            Types.select()

  transform3:
    pass:              Types.vertexPass()
    position:          Types.vec3()
    rotation:          Types.quat()
    scale:             Types.vec3(1, 1, 1)
    matrix:            Types.mat4(1, 0, 0, 0,
                            0, 1, 0, 0,
                            0, 0, 1, 0,
                            0, 0, 0, 1)
  transform4:
    pass:              Types.vertexPass()
    position:          Types.vec4()
    scale:             Types.vec4(1, 1, 1, 1)
    matrix:            Types.mat4(1, 0, 0, 0,
                            0, 1, 0, 0,
                            0, 0, 1, 0,
                            0, 0, 0, 1)

  polar:
    bend:              Types.number(1)
    helix:             Types.number(0)
  spherical:
    bend:              Types.number(1)
  stereographic:
    bend:              Types.number(1)

  interval:
    axis:              Types.axis()
  area:
    axes:              Types.swizzle([1, 2], 2)
  volume:
    axes:              Types.swizzle([1, 2, 3], 3)

  scale:
    divide:            Types.number(10)
    unit:              Types.number(1)
    base:              Types.number(10)
    mode:              Types.scale()

  grid:
    first:             Types.bool(true)
    second:            Types.bool(true)
  axis:
    detail:            Types.int(1)

  data:
    data:              Types.nullable(Types.object())
    map:               Types.nullable(Types.func())
    bind:              Types.nullable(Types.func())
    live:              Types.bool(true)
  buffer:
    channels:          Types.int(3)
    items:             Types.int(1)
  sampler:
    centered:          Types.bool(false)
  array:
    length:            Types.nullable(Types.int(1))
    history:           Types.int(1)
    bufferLength:      Types.int(1)
  matrix:
    width:             Types.nullable(Types.int(1))
    height:            Types.nullable(Types.int(1))
    history:           Types.int(1)
    bufferWidth:       Types.int(1)
    bufferHeight:      Types.int(1)
  voxel:
    width:             Types.nullable(Types.int(1))
    height:            Types.nullable(Types.int(1))
    depth:             Types.nullable(Types.int(1))
    bufferWidth:       Types.int(1)
    bufferHeight:      Types.int(1)
    bufferDepth:       Types.int(1)

  resolve:
    map:               Types.nullable(Types.func())
    items:             Types.int(1)

  style:
    opacity:           Types.number(1)
    color:             Types.color()
    blending:          Types.blending()
    zWrite:            Types.bool(true)
    zTest:             Types.bool(true)
    zIndex:            Types.absolute(Types.round())
    zBias:             Types.number(0)
    zOrder:            Types.nullable(Types.int())

  geometry:
    points:            Types.select()
    colors:            Types.nullable(Types.select())
  point:
    size:              Types.number(4)
    shape:             Types.shape()
    fill:              Types.bool(true)
    depth:             Types.number(1)
  line:
    width:             Types.number(2)
    depth:             Types.number(1)
    stroke:            Types.stroke()
  mesh:
    solid:             Types.bool(true)
    shaded:            Types.bool(true)
  strip:
    outline:           Types.bool(false)
  face:
    outline:           Types.bool(false)
  arrow:
    size:              Types.number(3)
    start:             Types.bool(false)
    end:               Types.bool(false)
  ticks:
    normal:            Types.vec3(0, 0, 1)
    size:              Types.number(10)
  attach:
    offset:            Types.vec2(0, -20)
    snap:              Types.bool(false)
    depth:             Types.number(0)

  format:
    digits:            Types.nullable(Types.number(3))
    expr:              Types.nullable(Types.func())
    live:              Types.bool(true)
  text:
    font:              Types.string('sans-serif')
    style:             Types.string()
    detail:            Types.number(24)
    expand:            Types.number(5)
  label:
    text:              Types.select()
    size:              Types.number(16)
    outline:           Types.number(2)
    expand:            Types.number(0)
    background:        Types.color(1, 1, 1)

  overlay:
    opacity:           Types.number(1)
    zIndex:            Types.absolute(Types.round(0))
  dom:
    points:            Types.select()
    html:              Types.select()
    size:              Types.number(16)
    outline:           Types.number(2)
    zoom:              Types.number(1)
    color:             Types.nullable(Types.color())
    attributes:        Types.nullable(Types.object())
    pointerEvents:     Types.bool(false)

  texture:
    minFilter:         Types.filter('nearest')
    magFilter:         Types.filter('nearest')
    type:              Types.type('float')

  shader:
    language:          Types.string('glsl')
    code:              Types.string()
    uniforms:          Types.nullable(Types.object())

  operator:
    source:            Types.select()
  spread:
    items:             Types.nullable(Types.vec4())
    width:             Types.nullable(Types.vec4())
    height:            Types.nullable(Types.vec4())
    depth:             Types.nullable(Types.vec4())
    alignItems:        Types.anchor()
    alignWidth:        Types.anchor()
    alignHeight:       Types.anchor()
    alignDepth:        Types.anchor()
  split:
    order:             Types.transpose('wxyz')
    axis:              Types.nullable(Types.axis())
    length:            Types.int(1)
    overlap:           Types.int(0)
  join:
    order:             Types.transpose('wxyz')
    axis:              Types.nullable(Types.axis())
    overlap:           Types.int(0)
  swizzle:
    order:             Types.swizzle()
  transpose:
    order:             Types.transpose()
  repeat:
    items:             Types.number(1)
    width:             Types.number(1)
    height:            Types.number(1)
    depth:             Types.number(1)
  lerp:
    items:             Types.nullable(Types.int())
    width:             Types.nullable(Types.int())
    height:            Types.nullable(Types.int())
    depth:             Types.nullable(Types.int())
  resample:
    indices:           Types.number(4)
    channels:          Types.number(4)
    map:               Types.mapping()
    scale:             Types.mapping('absolute')
    shader:            Types.select()
    items:             Types.nullable(Types.int())
    width:             Types.nullable(Types.int())
    height:            Types.nullable(Types.int())
    depth:             Types.nullable(Types.int())
  readback:
    indexed:           Types.bool()

  root:
    camera:            Types.nullable(Types.select())

  rtt:
    width:             Types.nullable(Types.int())
    height:            Types.nullable(Types.int())
    history:           Types.int(1)
  compose:
    alpha:             Types.bool(false)

  transition:
    flip:              Types.vec4()
    stagger:           Types.vec4()
    enter:             Types.number(0)
    exit:              Types.number(1)
    from:              Types.vec4()
    to:                Types.vec4()
    pass:              Types.vertexPass()

module.exports = Traits