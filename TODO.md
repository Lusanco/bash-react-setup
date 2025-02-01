# `TODO.md`

**`bash-react-setup.sh`**

- Rename - to `react-setup.sh`
- Cleanup
  - reduce lines of code
  - better the legibility
- Refactor
  - depending on the complexity and lines of code
  - Small scripts (<100 lines): Functions not always needed unless reusable logic exists.
  - Medium scripts (100-300 lines): Functions are recommended to break tasks into steps.
  - Large scripts (>300 lines): Functions are essential, and you may need to split the script into multiple files.
- Update - finishing touches

**`create-feature.sh`**

- generate a folder with the name of the feature and subdirectories:

  - components/
    - Section1/
      - Section1.tsx
      - Section1ComponentA.tsx
      - Section1ComponentB.tsx
      - and so on...
    - Section2/
    - Section3/
  - utils/
    - featureUtil.ts
  - hooks/
    - featureHook.ts
  - models/
    - FeatureModel.ts
  - interfaces/
    - IFeature.ts
  - styles/
    - feature.module.css
  - Feature.tsx

- ZIG
- Bash:
  - fzf (Fuzzy Finder)
  - gum
  - curl (Client URL)
  - jq
- Bash:
  - project setup automation
  - feature-based system to create
  - the final version, a full template of webpages that automates 60% plus of the work, only requiring to fill the missing data
