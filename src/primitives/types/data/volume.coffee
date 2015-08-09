Voxel = require './voxel'
Util = require '../../../util'

class Volume extends Voxel
  @traits = ['node', 'buffer', 'data', 'source', 'index', 'texture', 'voxel', 'span:x', 'span:y', 'span:z', 'volume', 'sampler:x', 'sampler:y', 'sampler:z', 'raw']

  callback: (callback) ->
    dimensions = @props.axes
    width      = @props.width
    height     = @props.height
    depth      = @props.depth

    centeredX  = @props.centeredX
    centeredY  = @props.centeredY
    centeredZ  = @props.centeredZ

    rangeX     = @_helpers.span.get 'x.', dimensions[0]
    rangeY     = @_helpers.span.get 'y.', dimensions[1]
    rangeZ     = @_helpers.span.get 'z.', dimensions[2]

    aX = rangeX.x
    aY = rangeY.x
    aZ = rangeZ.x

    spanX = rangeX.y - rangeX.x
    spanY = rangeY.y - rangeY.x
    spanZ = rangeZ.y - rangeZ.x

    if centeredX
      inverseX  = 1 / Math.max 1, width
      aX += spanX * inverseX / 2
    else
      inverseX  = 1 / Math.max 1, width - 1

    if centeredY
      inverseY  = 1 / Math.max 1, height
      aY += spanY * inverseY / 2
    else
      inverseY  = 1 / Math.max 1, height - 1

    if centeredZ
      inverseZ  = 1 / Math.max 1, depth
      aZ += spanZ * inverseZ / 2
    else
      inverseZ  = 1 / Math.max 1, depth - 1

    bX = spanX * inverseX
    bY = spanY * inverseY
    bZ = spanZ * inverseZ

    (emit, i, j, k) ->
      x = aX + bX * i
      y = aY + bY * j
      z = aZ + bZ * k
      callback emit, x, y, z, i, j, k

  make: () ->
    super
    @_helpers.span.make()

  unmake: () ->
    super
    @_helpers.span.unmake()

module.exports = Volume