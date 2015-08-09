View = require('./view')
Util = require '../../../util'

class Stereographic extends View
  @traits = ['node', 'object', 'view', 'view3', 'stereographic', 'transform']

  make: () ->
    super

    types = @_attributes.types
    @uniforms =
      stereoBend:     @node.attributes['stereographic.bend']
      viewMatrix:     @_attributes.make @_types.mat4()

    @viewMatrix          = @uniforms.viewMatrix.value
    @objectMatrix        = new THREE.Matrix4()

  unmake: () ->
    super

    delete @viewMatrix
    delete @rotationMatrix
    delete @uniforms

  change: (changed, touched, init) ->

    return unless touched['view'] or touched['view3'] or touched['stereographic'] or init

    @bend = bend = @props.bend

    o = @props.position
    s = @props.scale
    q = @props.rotation
    r = @props.range

    x = r[0].x
    y = r[1].x
    z = r[2].x
    dx = (r[0].y - x) || 1
    dy = (r[1].y - y) || 1
    dz = (r[2].y - z) || 1
    sx = s.x
    sy = s.y
    sz = s.z

    # Recenter viewport on projection point the more it's bent
    [z, dz] = Util.Axis.recenterAxis z, dz, bend, 1

    @uniforms.stereoBend.value    = bend

    # Forward transform
    @viewMatrix.set(
      2/dx, 0, 0, -(2*x+dx)/dx,
      0, 2/dy, 0, -(2*y+dy)/dy,
      0, 0, 2/dz, -(2*z+dz)/dz,
      0, 0, 0, 1 #,
    )
    @objectMatrix.compose o, q, s
    @viewMatrix.multiplyMatrices @objectMatrix, @viewMatrix

    if changed['view.range'] or touched['stereographic']
      @trigger
        type: 'view.range'

  transform: (shader, pass) ->
    shader.pipe 'stereographic.position', @uniforms if pass == 1
    super shader, pass

module.exports = Stereographic
