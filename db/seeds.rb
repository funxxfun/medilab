patients = [
  { name: '田中 一郎', age: 65, medical_history: '高血圧、糖尿病', insurance_number: '1234567890' },
  { name: '佐藤 花子', age: 42, medical_history: '喘息', insurance_number: '2345678901' },
  { name: '鈴木 太郎', age: 78, medical_history: '心疾患、高脂血症', insurance_number: '3456789012' }
]

patients.each do |patient_attrs|
  Patient.create!(patient_attrs)
end

puts "患者データを#{patients.count}件作成しました"


medications = [
  { name: 'アムロジピン', dosage_form: '錠剤', strength: '5mg', description: 'カルシウム拮抗薬、高血圧治療薬' },
  { name: 'メトホルミン', dosage_form: '錠剤', strength: '500mg', description: '糖尿病治療薬' },
  { name: 'サルブタモール', dosage_form: '吸入液', strength: '0.5%', description: '気管支拡張薬' },
  { name: 'アスピリン', dosage_form: '錠剤', strength: '100mg', description: '抗血小板薬' },
  { name: 'アトルバスタチン', dosage_form: '錠剤', strength: '10mg', description: 'スタチン系脂質異常症治療薬' }
]

medications.each do |medication_attrs|
  Medication.create!(medication_attrs)
end

puts "薬剤データを#{medications.count}件作成しました"



amlodipine = Medication.find_by(name: 'アムロジピン')
aspirin = Medication.find_by(name: 'アスピリン')
atorvastatin = Medication.find_by(name: 'アトルバスタチン')

interactions = [
  {
    medication1: amlodipine,
    medication2: aspirin,
    severity: :moderate,
    description: 'アムロジピンとアスピリンの併用で、降圧効果が減弱する可能性があります。血圧モニタリングを強化してください。'
  },
  {
    medication1: aspirin,
    medication2: atorvastatin,
    severity: :mild,
    description: 'アスピリンとアトルバスタチンの併用で、軽度の肝機能障害のリスクが上昇する可能性があります。定期的な肝機能検査を推奨します。'
  }
]

interactions.each do |interaction_attrs|
  Interaction.create!(interaction_attrs)
end

puts "薬剤相互作用データを#{interactions.count}件作成しました"

puts "サンプルデータの作成が完了しました！"