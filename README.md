# iProtect 输入保护驱动蓝屏排查（Windows 10 x64）

适用于多次 0xA 蓝屏且转储反复指向 CCInputProtect_x64.SYS 的情况。仅凭蓝屏代码不能确定驱动。本工具是可撤销的临时排查措施，非厂商补丁。优先通过所属银行或 IT 更新、正常卸载相关组件。停用可能影响网银登录与键盘输入。

1. 保存工作，确认有人能在电脑旁操作。查询服务用 sc.exe query CCInputProtector，查询启动设置用 sc.exe qc CCInputProtector。
2. 下载并完整解压本仓库。双击「2-检查状态.cmd」可只读查看状态。确认无需该组件后，右键「1-隔离驱动.cmd」，以管理员身份运行。工具只匹配指定服务、路径与一个已核对的 2.12.0.0 文件哈希，并检查已登记的设备和服务依赖。
3. 看到「隔离成功」才手动重启；若拒绝隔离或检查失败则停止，不要强删或强改权限。重启后运行「2-检查状态.cmd」，确认驱动服务已停止，检查键盘输入与原来的工作场景。单次启动正常不能证明长期修复。
4. 需要撤销时，以管理员身份运行「3-撤销隔离.cmd」，按提示重启。脚本只会还原它保留的驱动文件；如果原路径已被其他软件重新写入则停止。若组件反复重装，向厂商或 IT 获取兼容版本。

参考：[卸载残留及输入异常的用户反馈](https://learn.microsoft.com/zh-cn/answers/questions/4337218/ccinputprotect-x64-sys) · [同名驱动的 0xA 转储分析](https://learn.microsoft.com/zh-cn/answers/questions/3906541/dcp-wacthdog-violation)
