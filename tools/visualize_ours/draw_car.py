import json
import cv2
import numpy as np
import tools.visualize.vis_utils as tool

img = tool.get_rgb('v2x/visual/vehicle-side/img.jpg')
gt = tool.read_json('v2x/visual/vehicle-side/camera_gt.json')
calib_lidar2cam = tool.read_json('v2x/visual/vehicle-side/lidar_to_camera.json')
calib_intrinsic = tool.get_cam_calib_intrinsic('v2x/visual/vehicle-side/camera_intrinsic.json')

num_rects = 0
cam_points_3d = []
r_velo2cam, t_velo2cam = tool.get_lidar2cam(calib_lidar2cam)
for ob in gt:
    num_rects += 1
    h = np.float(ob['3d_dimensions']['h'])
    w = np.float(ob['3d_dimensions']['w'])
    L = np.float(ob['3d_dimensions']['l'])
    x = np.float(ob['3d_location']['x'])
    y = np.float(ob['3d_location']['y'])
    z = np.float(ob['3d_location']['z'])
    z = z - h / 2
    dimensions_3d = np.array([L, w, h])
    location_3d = np.array([x, y, z])
    rotation = np.array(ob['rotation'])
    corner = tool.compute_box_3d(dimensions_3d, location_3d, rotation)  # 点云坐标系下3D框8个顶点的3D坐标
    # print(corner)
    camera_8_points = np.array((r_velo2cam * np.matrix(corner).T + t_velo2cam).T)  # 相机坐标系下3D框8个顶点的3D坐标
    cam_points_3d.append(camera_8_points)

cam_points_3d = np.stack(cam_points_3d)
points_2d = np.array(tool.points_cam2img(cam_points_3d, calib_intrinsic))
print(num_rects)
print(points_2d.shape)

img = tool.plot_rect3d_on_img(img, num_rects, points_2d)

cv2.imwrite('v2x/visual/veh_gt.jpg', img)
