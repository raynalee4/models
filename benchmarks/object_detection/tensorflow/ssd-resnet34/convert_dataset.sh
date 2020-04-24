# We are going to use an older version of the conversion script to checkout the git commit
#cd /intel/tensorflow-models
#git checkout fd34f711f319d8c6fe85110d9df6e1784cc5a6ca

cd /intel/tensorflow-models/research/object_detection/dataset_tools/
python create_coco_tf_record.py --logtostderr \
      --train_image_dir="/intel/coco/empty_dir" \
      --val_image_dir="/intel/coco/val/val2017" \
      --test_image_dir="/intel/coco/empty_dir" \
      --train_annotations_file="/intel/coco/annotations/empty.json" \
      --val_annotations_file="/intel/coco/annotations/instances_val2017.json" \
      --testdev_annotations_file="/intel/coco/annotations/empty.json" \
      --output_dir="/intel/coco/output"

ls -l /intel/coco/output

# Go back to the main models directory and checkout the SHA that we are using for SSD-ResNet34
#cd /intel/tensorflow-models
#git checkout f505cecde2d8ebf6fe15f40fb8bc350b2b1ed5dc

mv /intel/coco/output/coco_val.record /intel/coco/output/validation-00000-of-00001
