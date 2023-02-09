import os
import json
import numpy as np
import pickle

save_path = '/workspace/mnt/storage/guangcongzheng/zju_fbz_backup/DAIR-V2X-C-test_A/cache/test/'
path = '/workspace/mnt/storage/guangcongzheng/zju_fbz_backup/DAIR-V2X-C-test_A/cache/vic-late-lidar/result/'

num = 0

for root, dirs, files in os.walk(path):
    for file in files:
        name = os.path.join(root, file)
        f = open(name, 'rb')
        data = pickle.load(f)
        result = {}
        result['boxes_3d'] = []
        result['scores_3d'] = []
        result['labels_3d'] = []
        result['ab_cost'] = data['ab_cost']

        boxes_3d = np.array(data['boxes_3d']).tolist()
        scores_3d = np.array(data['scores_3d']).tolist()
        labels_3d = np.array(data['labels_3d']).tolist()

        for i in range(0, len(labels_3d)):
            labels_3d[i] = int(labels_3d[i])
            if labels_3d[i] == 2:
                result['boxes_3d'].append(boxes_3d[i])
                result['scores_3d'].append(scores_3d[i])
                result['labels_3d'].append(labels_3d[i])

        with open(save_path + file[:-4] + '.json', 'w') as f2:
            json.dump(result, f2)
        num += 1
    print(num)
