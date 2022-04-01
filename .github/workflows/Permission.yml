name: CreateServiceFoldersWithPermission
  on: push
  
  jobs: 
    build :
       
        run-on: ubuntu-latest
        steps: 
      - name : checkout repo
        uses: action/checkout
        shell: pwsh
       - run: |
   .\CreateServiceFoldersWithPermissionOSeries.ps1
