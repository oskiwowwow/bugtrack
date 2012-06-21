class CreateEnums < ActiveRecord::Migration
  def change
    create_table :enums do |t|
      t.string :name
      t.string :description
      t.string :enum_type
      t.timestamps
    end
    Enum.create(name: "New", enum_type: 'status')
    Enum.create(name: "Assigned", enum_type: 'status')
    Enum.create(name: "Work in progress", enum_type: 'status')
    Enum.create(name: "Pending customer response", enum_type: 'status')
    Enum.create(name: "Fixed in next release", enum_type: 'status')
    Enum.create(name: "Closed", enum_type: 'status')
    Enum.create(name: "1-High", enum_type: 'priority')
    Enum.create(name: "2-Medium", enum_type: 'priority')
    Enum.create(name: "3-Low", enum_type: 'priority')
    Enum.create(name: "1-Critical", enum_type: 'severity')
    Enum.create(name: "2-Serious", enum_type: 'severity')
    Enum.create(name: "3-Moderate", enum_type: 'severity')
    Enum.create(name: "4-NonCrit", description: "Non-critical", enum_type: 'severity')
    Enum.create(name: "Access Control", enum_type: 'area')
    Enum.create(name: "Database", enum_type: 'area')
    Enum.create(name: "Performance", enum_type: 'area')
    Enum.create(name: "Platform", enum_type: 'area')
    Enum.create(name: "Supporting Software", enum_type: 'area')
    Enum.create(name: "UI", description: "User interface", enum_type: 'area')
    Enum.create(name: "TBD", description: "To Be Determined", enum_type: 'release')
    Enum.create(name: "5.4.1.1", enum_type: 'release')
    Enum.create(name: "5.4.1.2", enum_type: 'release')
    Enum.create(name: "Other", description: "Any other release", enum_type: 'release')
    Enum.create(name: "Production", description: "Production application", enum_type: 'system')
    Enum.create(name: "Development", description: "Developer environment", enum_type: 'system')
    Enum.create(name: "QA", description: "Quality Assurance application", enum_type: 'system')
  end
end
