package serveyweb;

import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class MainCtrl {
	private ServeyDAO sdao= new ServeyDAO();
	private SongDAO songDAO= new SongDAO();
	private UserDAO udao=new UserDAO();
	private JoinDAO jdao= new JoinDAO();
	private Scanner sc;
	private SongVO svo;
	private UserVO uvo;
	private int index;
	private boolean songInput=false;
	private boolean infostat=true;
	
	public boolean inter() throws ScopeException{
		boolean startEnd=true;
		sc= new Scanner(System.in);
		loop1:while(infostat) {
		try {
			System.out.println("\t���� ��������");
			System.out.println("\t1. ���� ����");
			System.out.println("\t2. ���� ���� ��Ȳ");
			System.out.printf("\t");
			index=sc.nextInt();
			if(index==1) {
			System.out.println("\t������ ������ �ּż� �����մϴ�!\n\n\t�ڽ��� ���� �븦 �Է����ּ���\n\t Ex)20�� �̸� 20�� �Է� ��Ź�帳�ϴ�.\n");
			System.out.printf("\t");
			int age=sc.nextInt();
			if(ageTran(age)) {
				System.out.println("\t������ �Է����ּ���\n \t1. ���� 2. ����\n");
				int gender=genderChoice();
				if(gender==1 ||gender==2) {
						try {
							forPrint(age, gender);
						} catch (SQLException e) {
							e.printStackTrace();
						}
						break;
				}else {System.out.println("\t���� �� ���� ��ȣ�� �Է��ϼ̽��ϴ�.\n \tù ȭ������ ���ư��ϴ�.�Ϸη�\n ");
					break;
				}
			}
			}else if(index==2) {
				int mindex=0;
				int serveyCount=0;
				try {
					serveyCount=sdao.selectServeyCount();
					if(serveyCount==0) {
						System.out.println("------------------------------------------------------------------------");
						System.out.println("\n\t����� ������ �ۼ����� �ʾҽ��ϴ�.\n \t���� �ٽ� Ȯ�� ��Ź�帳�ϴ�.\n");
					}else {
						System.out.println("------------------------------------------------------------------------");
						System.out.println("\t������� ����� ������ Ƚ����:\t"+serveyCount);
						System.out.println("\n\t1.�帣 ���� ����\n\t2.���ɴ� �� �帣 ���� ����\n\t3. �帣��  ��õ �뷡 ����\n\t4. ���� �帣 ����");
						System.out.printf("\t");
						mindex=sc.nextInt();
						if(mindex==1) {
							int selectquery=2;
							try {
								forPrint(selectquery);
							} catch (SQLException e) {
							}
						}else if(mindex==2) {
							int selectquery=mindex;
							try {
								forPrintJDAO(selectquery);
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}else if(mindex==3){
							int selectquery=mindex;
							try {
								forPrintJDAO(selectquery);
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}else if(mindex==4) {
							System.out.println("------------------------------------------------------------------------");
							System.out.println("\t���� ��ȣ���� ������� ������ �Է����ּ���\n \t1. ���� 2. ����\n");
							int gender=genderChoice();
							List<JoinVO>ret=jdao.selectGender(gender);
							int i=0;
							for(JoinVO tmp: ret) {
								i++;
								System.out.println("\t"+i+"\t"+tmp.genderQueryString());
							}
							System.out.println("------------------------------------------------------------------------");

							
						}
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
			}else {
				System.out.println("\t��Ͽ� ���� ������ ���ư���~\n");
				continue loop1;
			}
		}
		catch(InputMismatchException e) {
			System.out.println("\t�Է������� �߸��Ǿ� ���ư��ϴ�.\n");
			inter();
			}
		}
		return startEnd;
	}

	public int genderChoice() {
		int gender;
		System.out.printf("\t");
		gender=sc.nextInt();
		return gender;
	}
//	public char genderChoice() {
//		char gender;
//		return gender;
//	}
	public boolean ageTran(int age) {
		boolean agestat=true;
		if(age%10!=0) {
			System.out.println("\t�߸� �Է��ϼ̽��ϴ� ó�� �ȳ��� ���ư��ϴ�\n");
			agestat=false;
			return agestat;
		}
		return agestat;
	}
	public void forPrint(int age, int gender) throws SQLException {
		System.out.println("\t�帣 ���� ���");
		int a=1;
		List<ServeyVO>ret=sdao.selectAll(a);
		int serveyIndex;
		for( serveyIndex=0; serveyIndex<ret.size(); serveyIndex++) {
			System.out.println("\t"+(serveyIndex+1)+".  "+ret.get(serveyIndex));
		}
		if(serveyIndex==ret.size()) {
			System.out.println("\t"+(serveyIndex+1)+"��Ÿ()\n");
		}
		serveyIndex++;
		turnTable(age, gender,serveyIndex);
		}

	public void forPrint(int a) throws SQLException{
		List<ServeyVO>ret=sdao.selectAll(a);
		int i=0;
		for(ServeyVO tmp: ret) {
			i++;
			System.out.println("\t"+i+"\t"+tmp.inString());
		}
		System.out.println("------------------------------------------------------------------------");
	}
	public void forPrintJDAO(int selectquery) throws SQLException{
		if(selectquery==2) {
		List<JoinVO>ret=jdao.selectAll();
		int i=0;
		for(JoinVO tmp: ret) {
			i++;
			System.out.println("\t"+i+"\t"+tmp.secondQueryString());
		}
		System.out.println("------------------------------------------------------------------------");
		}else if(selectquery==3) {
			List<JoinVO>ret=jdao.selectThree();
			int i=0;
			for(JoinVO tmp: ret) {
				i++;
				System.out.println("\t"+i+"\t"+tmp.threeQueryString());
			}
			System.out.println("------------------------------------------------------------------------");
		}
	}
	
	public void turnTable(int age, int gender,int i){
	System.out.println("\t��ȣ�Ͻô� �帣�� ������ �ּ���\n");
	System.out.printf("\t");
	int value=0;
	try {
		value=sc.nextInt();
	}catch(InputMismatchException e) {
		System.out.println("\t�Է������� �߸��Ǿ� ���ư��ϴ�.\n");
			try {
				inter();
			} catch (ScopeException e1) {
				e1.printStackTrace();
			}
	}
	if(value==i) {
		if(etc(age, gender, value)) {
			try {
				value=sdao.lastServey_Code(); 
				if(makeUser( value, age, gender)) {
					songIn( age,  gender, value);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}else if(value<i){
		try {
			sdao.updateInfo(value);
			if(makeUser( value, age, gender)) {
				songIn( age,  gender, value);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	}
	public boolean etc(int age, int gender, int value) {
		boolean inputServeyName=true;
		String servey="";
		sc.nextLine();
		servey=sc.nextLine();
		songInput=true;
			try {
				if(sdao.selectServeyName(servey)) {
					sdao.insertServey(servey);
					inputServeyName=true;
				}else {inputServeyName=false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return inputServeyName;
	}
	public boolean etc(int age, int gender, int value, String serN) {
		boolean inputServeyName=true;
		songInput=true;
			try {
				if(sdao.selectServeyName(serN)) {
					sdao.insertServey(serN);
					inputServeyName=true;
				}else {inputServeyName=false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return inputServeyName;
	}
	
	public boolean songIn(int age,int gender, int value) {
		boolean songInComplete=true;
		String songname="";
		if(songInput==false) {
			sc.nextLine();songname=sc.nextLine();
		}else if(songInput==true) {
			songname=sc.nextLine();
			songInput=false;
		}
		svo=new SongVO(songname,value);
		try {
			if(songDAO.selectOne(songname, value)) {
				songDAO.insertSong(svo);
			}else if(!songDAO.selectOne(songname, value)) {
				songDAO.updateSongCount(songname,value);
			}
		} catch (SQLException e) {
			System.out.println("\t���� �߸� �Ǿ��׿�");
			songInComplete=false;
		}
		System.out.println("\t������ �������ּż� �����մϴ�\n\n");
		return songInComplete;
	}
	public boolean songIn(int age,int gender, int value,String songN) {
		boolean songInComplete=true;
		System.out.println(svo);
		try {
			if(songDAO.selectOne(songN, value)) {
				songDAO.updateSongCount(songN,value);
			}else if(!songDAO.selectOne(songN, value)) {
				songDAO.insertSong(svo);
			}
		} catch (SQLException e) {
			songInComplete=false;
		}
		return songInComplete;
	}
	
	public boolean makeUser(int value,int age,int gender) throws SQLException{
		boolean s=false;
		char cGender='n';
		if(gender==1) {
			cGender='M';
		}else if(gender==2) {
			cGender='F';
		}
		uvo=new UserVO(value, age, cGender);
		if(udao.selectUser(value, age, cGender)) {
			try {
				udao.returnUserCount(uvo);
				s=udao.updateUserCount(uvo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(udao.selectUser(value, age, cGender)==false) {
			s=udao.insertUser(uvo);
		}
		return s;
	}
	public boolean makeUser(int value,int age,char gender) throws SQLException{
		boolean s=false;
		uvo=new UserVO(value, age, gender);
		if(udao.selectUser(value, age, gender)) {
			try {
				udao.returnUserCount(uvo);
				s=udao.updateUserCount(uvo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(udao.selectUser(value, age, gender)==false) {
			s=udao.insertUser(uvo);
		}
		return s;
	}
}
