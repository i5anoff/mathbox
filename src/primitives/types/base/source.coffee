Primitive = require '../../primitive'
Util      = require '../../../util'

class Source extends Primitive
  @traits = ['node', 'source', 'index']

  made: () ->
    # Notify of buffer reallocation
    @trigger
      type: 'source.rebuild'

  indexShader:  (shader) -> shader.pipe Util.GLSL.identity 'vec4'
  sourceShader: (shader) -> shader.pipe Util.GLSL.identity 'vec4'

  getDimensions: () ->
    items:  1
    width:  1
    height: 1
    depth:  1

  getActiveDimensions: () ->
    items:  1
    width:  1
    height: 1
    depth:  1

  getIndexDimensions: () -> @getActiveDimensions()

module.exports = Source