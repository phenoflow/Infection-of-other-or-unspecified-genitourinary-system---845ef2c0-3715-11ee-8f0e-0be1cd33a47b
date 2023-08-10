cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  infection-of-other-or-unspecified-genitourinary-system-tuberculosis---secondary:
    run: infection-of-other-or-unspecified-genitourinary-system-tuberculosis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  urogenital-infection-of-other-or-unspecified-genitourinary-system---secondary:
    run: urogenital-infection-of-other-or-unspecified-genitourinary-system---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: infection-of-other-or-unspecified-genitourinary-system-tuberculosis---secondary/output
  periurethral-infection-of-other-or-unspecified-genitourinary-system---secondary:
    run: periurethral-infection-of-other-or-unspecified-genitourinary-system---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: urogenital-infection-of-other-or-unspecified-genitourinary-system---secondary/output
  gonococcal-infection-of-other-or-unspecified-genitourinary-system---secondary:
    run: gonococcal-infection-of-other-or-unspecified-genitourinary-system---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: periurethral-infection-of-other-or-unspecified-genitourinary-system---secondary/output
  chlamydial-infection-of-other-or-unspecified-genitourinary-system---secondary:
    run: chlamydial-infection-of-other-or-unspecified-genitourinary-system---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: gonococcal-infection-of-other-or-unspecified-genitourinary-system---secondary/output
  chancroid-infection-of-other-or-unspecified-genitourinary-system---secondary:
    run: chancroid-infection-of-other-or-unspecified-genitourinary-system---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: chlamydial-infection-of-other-or-unspecified-genitourinary-system---secondary/output
  infection-of-other-or-unspecified-genitourinary-system---secondary:
    run: infection-of-other-or-unspecified-genitourinary-system---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: chancroid-infection-of-other-or-unspecified-genitourinary-system---secondary/output
  infection-of-other-or-unspecified-genitourinary-system-vulva---secondary:
    run: infection-of-other-or-unspecified-genitourinary-system-vulva---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: infection-of-other-or-unspecified-genitourinary-system---secondary/output
  infection-of-other-or-unspecified-genitourinary-system-candidiasis---secondary:
    run: infection-of-other-or-unspecified-genitourinary-system-candidiasis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: infection-of-other-or-unspecified-genitourinary-system-vulva---secondary/output
  infection-of-other-or-unspecified-genitourinary-system-abscess---secondary:
    run: infection-of-other-or-unspecified-genitourinary-system-abscess---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: infection-of-other-or-unspecified-genitourinary-system-candidiasis---secondary/output
  infection-of-other-or-unspecified-genitourinary-system-classified---secondary:
    run: infection-of-other-or-unspecified-genitourinary-system-classified---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: infection-of-other-or-unspecified-genitourinary-system-abscess---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: infection-of-other-or-unspecified-genitourinary-system-classified---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
