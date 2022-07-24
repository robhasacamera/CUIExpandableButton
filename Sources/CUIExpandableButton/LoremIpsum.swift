//
// CUIExpandableButton
//
// MIT License
//
// Copyright (c) 2022 Robert Cole
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation

class LoremIpsum {
    static let shared = LoremIpsum()

    let paragraphSeperator = "\n\n"

    let wordSeparator = " "

    private(set) lazy var wordArray: [String] = ipsumText.replacingOccurrences(of: paragraphSeperator, with: wordSeparator).components(separatedBy: wordSeparator)

    private(set) lazy var paragraphArray: [String] = ipsumText.components(separatedBy: paragraphSeperator)

    private init() {}

    func words(_ count: Int = 2) -> String {
        wordArray.prefix(count).joined(separator: wordSeparator)
    }

    func paragraphs(_ count: Int = 2) -> String {
        paragraphArray.prefix(count).joined(separator: paragraphSeperator)
    }

    static func words(_ count: Int = 2) -> String {
        shared.words(count)
    }

    static func paragraphs(_ count: Int = 2) -> String {
        shared.paragraphs(count)
    }

    // Text from https://www.lipsum.com
    private let ipsumText =
        """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc imperdiet sapien non neque sagittis, non dapibus velit consectetur. Mauris nec semper tellus. Praesent nisi eros, efficitur nec mi at, mollis rutrum mauris. Morbi et orci id purus consectetur rutrum. Nunc eget dignissim erat. Donec mattis felis id nunc commodo ultrices. Fusce at urna accumsan, facilisis lacus id, feugiat magna. Suspendisse et lorem nunc. Pellentesque sollicitudin, sapien id interdum luctus, ante enim commodo mi, pellentesque ultricies arcu metus vitae mauris. Duis fermentum pulvinar dolor, vitae lobortis eros varius congue.

        Donec quis felis pharetra, sollicitudin libero quis, bibendum quam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus id nunc cursus, aliquet neque quis, tempor mauris. Ut ultricies, risus in blandit vestibulum, erat libero semper metus, id facilisis eros erat ac eros. Mauris eget laoreet felis. Etiam lobortis tellus sed purus fringilla eleifend. Nunc ornare est ut massa venenatis iaculis. Quisque sit amet aliquam mi. Etiam posuere mauris lectus, nec vulputate est condimentum eu. Aliquam rhoncus elit quis odio suscipit, ut facilisis elit pellentesque. Praesent tempor volutpat metus ac molestie. Ut facilisis, leo ac consequat dapibus, risus nisi convallis tellus, sit amet eleifend erat velit et ligula. Proin iaculis semper nisl, vitae placerat lacus malesuada vitae. Praesent placerat ac nunc quis faucibus. In hac habitasse platea dictumst. Vestibulum scelerisque sapien ex.

        Lorem ipsum dolor sit amet, consectetur adipiscing elit. In mattis, libero eu faucibus varius, justo velit aliquam erat, vitae placerat lorem mauris vel lorem. Phasellus non dignissim nisl, eget pretium magna. Vestibulum convallis, augue et fermentum porta, enim diam tristique quam, id scelerisque quam elit et enim. Ut non arcu sit amet lorem volutpat efficitur. Pellentesque euismod sollicitudin mauris sit amet sodales. Cras consequat tempus ipsum eget aliquet. Ut quam ligula, tincidunt non mauris eget, mollis tincidunt orci. Nullam eget leo quis nunc ornare fermentum.

        Etiam semper rutrum ante at semper. Vivamus tempor, turpis placerat pretium dignissim, leo leo fringilla nunc, sit amet porta ipsum nulla in sem. Vestibulum id nulla id ante finibus pellentesque sed sit amet diam. Nulla eu tristique lorem. Vivamus commodo sit amet odio ut suscipit. In pellentesque quam et tempus mollis. Maecenas vestibulum nunc quam, eu mattis massa lobortis in. Curabitur interdum enim vel gravida accumsan. Duis malesuada arcu felis, eleifend hendrerit ipsum tincidunt eget. Pellentesque ante ante, blandit eu dignissim sed, lobortis tristique augue. Vestibulum varius tellus nec ipsum vehicula, quis interdum orci efficitur. Praesent faucibus tincidunt dui tincidunt convallis. Vivamus diam diam, eleifend eget felis id, laoreet feugiat arcu.

        Proin elit leo, auctor sit amet imperdiet ultricies, faucibus vitae urna. Phasellus condimentum efficitur nisl, tincidunt tempor lorem consequat vel. Donec vestibulum, justo id aliquam rutrum, turpis arcu suscipit erat, in semper orci nibh sit amet felis. Cras vestibulum metus sed justo pellentesque, viverra sollicitudin tortor tempus. Suspendisse vitae nibh nunc. Aenean in efficitur elit, ac aliquet lorem. Aenean sed augue at diam tempor commodo a ullamcorper lectus. Proin at placerat nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc vel est congue, vehicula mauris in, pretium neque. Suspendisse condimentum risus non nulla bibendum malesuada. Ut placerat nulla quis laoreet tincidunt. Praesent efficitur sollicitudin felis, sit amet mollis magna ultrices eget.

        Curabitur ut orci nec felis hendrerit laoreet. Maecenas scelerisque elementum purus, at semper sem placerat ut. Sed eu metus iaculis nulla lacinia dapibus interdum sed eros. Aenean auctor consectetur nunc, id elementum nisi lacinia placerat. Quisque justo est, commodo id facilisis id, tincidunt dignissim nunc. Donec pretium fermentum ipsum sed tristique. In pretium tincidunt vestibulum. Nam molestie dui nisl, ac aliquam neque ullamcorper sit amet. Vestibulum eu sapien ligula. In consequat gravida mauris tincidunt aliquet. Nam hendrerit massa ipsum, et suscipit dui eleifend at. Integer congue est est, sed tincidunt dolor rutrum in. Proin euismod purus eget velit ultricies egestas.

        Nunc at magna ac justo finibus convallis. Suspendisse potenti. Suspendisse potenti. Maecenas eu enim vitae odio gravida iaculis vel eu quam. Maecenas feugiat dui ac erat imperdiet, nec dapibus purus feugiat. Etiam tristique, ante ac placerat consectetur, nulla enim tincidunt augue, quis mollis ex dolor sit amet nunc. Integer sit amet molestie elit, at imperdiet dui. Sed facilisis, ligula at viverra imperdiet, ipsum nunc egestas nulla, quis iaculis ex metus et elit. Pellentesque sit amet enim eget elit scelerisque egestas eget quis metus. Nulla et dictum ligula, id vehicula dui.

        Cras sit amet neque ut magna vulputate sollicitudin porta sit amet diam. Aliquam lacinia varius placerat. Nunc nec sem volutpat, feugiat odio eget, sodales odio. Sed quis nisl viverra diam sollicitudin lacinia sit amet a diam. Ut efficitur eros quam, quis pulvinar orci gravida eu. Nulla vel felis porttitor, molestie dui id, rhoncus magna. Curabitur rhoncus justo sit amet enim mollis, ac blandit risus suscipit. Duis pretium eros sit amet hendrerit fermentum. Proin convallis purus in metus facilisis facilisis. Phasellus erat neque, porta vel dignissim sit amet, lacinia id lorem. Nam dolor nisi, imperdiet non mauris ut, luctus pretium sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque tristique magna purus, vitae varius nibh ullamcorper quis. Nulla arcu enim, posuere quis lectus quis, rutrum maximus dui. Nullam sed porta felis. Fusce hendrerit augue et elit euismod viverra.

        Praesent eros ante, pellentesque in dignissim et, congue in nulla. Nullam sit amet mi urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed efficitur at lectus eget tincidunt. Sed tortor nisl, porta at porta nec, auctor rhoncus neque. Quisque convallis finibus arcu, ut porta libero tincidunt quis. Duis velit mauris, finibus ut felis quis, fringilla dapibus lacus. Curabitur eget posuere ex.

        Nam vestibulum tempus risus eget blandit. Sed tempor venenatis ipsum at commodo. Etiam vitae neque semper, rutrum urna sed, consectetur tortor. Praesent ligula sapien, lobortis sagittis nulla eu, mollis gravida nisi. Sed at erat neque. Aliquam a risus ultrices, dignissim sapien non, tempus erat. Curabitur non neque eros. Quisque non nulla ut ex fringilla gravida. Sed magna ante, maximus non condimentum sed, commodo a lectus.

        Praesent a elit a purus feugiat fringilla ut eget urna. Aliquam nunc augue, malesuada eget condimentum mollis, fermentum at turpis. Vestibulum gravida pharetra consequat. Suspendisse eu libero sed nibh faucibus pharetra dignissim eu nibh. Quisque hendrerit eleifend odio ut rhoncus. Phasellus vestibulum efficitur dui, eu fringilla lectus congue non. Donec condimentum faucibus leo, vitae suscipit massa auctor quis. Nunc commodo sem a arcu tempus sollicitudin. Nulla facilisi. Nullam id turpis ut justo aliquam pellentesque. Phasellus non lacus sit amet magna luctus fringilla. Vestibulum placerat est quis sem pretium, non cursus nulla consectetur.

        Nullam mollis libero a eleifend convallis. Quisque ac ex nisl. Vestibulum accumsan gravida tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris venenatis consequat augue, ut iaculis ante porttitor eget. Vivamus commodo nisi id odio finibus, vitae tristique erat accumsan. Cras egestas, massa vel volutpat posuere, metus nisl condimentum augue, sit amet posuere massa purus sed est. Integer tempus elit a ligula commodo, vel ultricies eros finibus. Vivamus eget augue ac turpis eleifend rhoncus at sit amet arcu. Phasellus laoreet fringilla odio, at imperdiet felis consequat fringilla. Proin ac lectus pretium, lacinia sapien in, euismod leo.

        Praesent molestie iaculis lectus. Quisque sed purus magna. Vestibulum lacinia, quam et pellentesque bibendum, odio nisl euismod diam, id dictum nulla orci vel tellus. Curabitur quis auctor nisi. Pellentesque laoreet mattis rutrum. Donec iaculis ut odio et sollicitudin. Phasellus malesuada fringilla tellus, pulvinar faucibus ante venenatis in. Integer ultrices sed est non iaculis. Suspendisse sit amet est ut lectus egestas scelerisque sed eu quam. Sed scelerisque blandit turpis id auctor.

        Phasellus id enim semper, vehicula massa ac, dictum mauris. Cras et ex mi. Suspendisse non ante eget dolor scelerisque imperdiet eu vel massa. Nam sit amet condimentum libero. Vestibulum nunc mauris, mollis nec urna in, posuere finibus est. Suspendisse quis sapien vitae lorem porta consectetur cursus varius massa. Phasellus ullamcorper posuere risus a imperdiet. Cras in lorem nisi. Pellentesque commodo sit amet tortor sed sodales. Nulla sit amet ornare ligula. Vestibulum tincidunt tincidunt orci eu facilisis.

        Nunc ligula augue, rutrum eu sem eu, fringilla tempus felis. Quisque blandit leo sed blandit eleifend. Vestibulum in neque sem. Ut gravida odio at scelerisque ultricies. Duis quis sapien congue, sagittis ex vel, egestas odio. Nam sodales, nibh ac elementum tristique, sem risus tincidunt ex, sit amet efficitur elit nunc non tortor. Nunc fermentum bibendum ante nec porta. Vestibulum neque quam, mattis accumsan lectus vel, bibendum dapibus dui. Vivamus ornare tempus turpis, quis dignissim eros mattis a. Etiam vulputate aliquam erat, a hendrerit elit condimentum in.

        Nulla tempus viverra quam mattis convallis. Fusce sodales facilisis hendrerit. Donec sit amet velit in urna eleifend mollis vitae eget justo. Phasellus at tempus erat. Cras eget magna ac erat pulvinar vulputate sed vitae libero. Morbi eget nibh consequat, vehicula nibh vel, volutpat ex. Fusce sagittis convallis augue non vestibulum. Curabitur consequat volutpat felis, sagittis dapibus ex auctor at. Nulla at pulvinar diam. Aliquam condimentum felis ac ipsum accumsan, id blandit sem ultricies. Pellentesque vehicula pellentesque tortor, ac placerat justo. Sed sit amet vestibulum metus, quis pulvinar nunc. Morbi in sem enim. Duis sollicitudin nisl ut porttitor blandit. Sed in laoreet sem.

        Morbi suscipit, erat in aliquam volutpat, tortor sapien vehicula mi, ut vestibulum tortor odio ac nibh. Nam ut porttitor eros, quis congue enim. Etiam aliquam dui ut massa hendrerit mollis. Quisque vitae arcu vel orci convallis mattis. Nunc id neque eleifend, aliquam quam et, pulvinar odio. Ut pellentesque turpis lobortis arcu mollis, et vulputate lorem euismod. Mauris et convallis tortor. In vitae eros mollis, aliquam ligula sit amet, elementum nibh. Suspendisse consectetur euismod tellus non cursus. Phasellus ac luctus elit. Vivamus eu rutrum mauris.

        Nam vel iaculis lorem. Duis maximus pretium consequat. Quisque fringilla blandit elit. Praesent cursus purus neque, vitae placerat dui mattis sit amet. Praesent quis diam rutrum, maximus neque sed, hendrerit nunc. Donec dignissim, tortor non tristique rhoncus, nibh nulla imperdiet lorem, eu tincidunt neque eros tempus sapien. Aenean at nisi vitae magna lacinia pulvinar sed vel felis. Mauris elit felis, aliquam a leo et, pellentesque dapibus ipsum. Duis dignissim ligula id neque tempor varius. Morbi sit amet augue quis purus imperdiet viverra. Nulla vestibulum at odio at semper.

        Proin porttitor tristique magna, nec dictum purus blandit sit amet. Aenean commodo nibh gravida purus condimentum, sit amet placerat risus tristique. Sed quis blandit lorem. Aenean elementum imperdiet blandit. Donec ultrices orci non mauris vulputate, a aliquet purus aliquet. Cras consectetur molestie mi ut pharetra. Nullam tincidunt nisl id leo dapibus, nec tempor augue accumsan. Aliquam aliquam massa ut enim tincidunt, nec faucibus lorem volutpat. Quisque vel felis a orci pharetra pretium sed eu velit. Praesent vitae felis pellentesque, tincidunt dolor ullamcorper, varius turpis. Maecenas maximus dui elit.

        Sed dapibus, magna at pretium condimentum, arcu sem accumsan nulla, quis tincidunt nisi ipsum ut ipsum. Sed volutpat rutrum condimentum. Curabitur ac justo sed sapien hendrerit consequat vel ac nisl. Cras a orci viverra, faucibus metus quis, lacinia est. Maecenas quis quam et ipsum semper suscipit vel eu odio. Morbi ac vestibulum neque. Nulla ut consequat metus, nec ultrices arcu. Quisque posuere risus sit amet nunc ullamcorper ultrices. Donec ornare metus in ligula finibus semper. Proin venenatis risus eget commodo tristique. Vestibulum dignissim pellentesque est eu placerat. Donec elementum tellus eu ipsum dictum tempus. Suspendisse at posuere odio.

        In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam semper, augue et eleifend cursus, metus erat posuere dui, vel interdum ipsum massa eleifend turpis. Quisque lobortis dapibus elit. Suspendisse nec turpis ut lacus congue venenatis. Duis aliquet lobortis libero vulputate rhoncus. Sed dignissim elementum sapien, non porttitor arcu pretium sit amet. Vestibulum malesuada non arcu in iaculis.

        Donec aliquet, massa eget vehicula maximus, tellus tellus pellentesque arcu, et placerat metus ligula vitae turpis. Proin condimentum lacus eu convallis pharetra. Praesent tincidunt gravida sem id ullamcorper. Donec rutrum felis et enim aliquam, nec auctor velit tincidunt. Proin consectetur nec lectus eget aliquet. Maecenas pharetra suscipit massa. Nunc hendrerit nunc vitae placerat suscipit. Suspendisse non tempor ipsum, iaculis posuere massa. Vestibulum consequat quam eu malesuada suscipit. Nulla ultrices sapien sed lorem tincidunt semper. Nulla ipsum ligula, euismod a nibh eu, fermentum ullamcorper erat. Aliquam ut congue odio, vel malesuada sem. Donec mollis diam sapien, quis consequat elit auctor quis. Nunc placerat arcu at imperdiet iaculis. Nunc consequat lobortis sem, at rhoncus tortor rhoncus vel.

        Donec aliquet malesuada diam, vel dapibus tellus. Donec quis lacus vehicula, vestibulum neque sed, pellentesque lorem. Aliquam fermentum metus quis ipsum pulvinar commodo. Curabitur eu nibh arcu. Morbi erat nibh, posuere eget arcu in, molestie molestie nulla. Nulla sed ante ut nulla interdum egestas ac in lectus. Morbi hendrerit augue nisi, in tincidunt metus interdum eleifend.

        Praesent commodo pellentesque consectetur. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel magna ac metus suscipit facilisis. Aliquam dignissim ultrices lectus. Morbi ultrices et neque at viverra. Duis consequat non magna non facilisis. Aenean massa lacus, maximus eu vestibulum ac, pretium id arcu. Donec nisl orci, eleifend fermentum elit id, condimentum ultricies dui. Ut at feugiat metus. Integer eu enim a mauris imperdiet interdum auctor non lorem. Sed scelerisque ante ut fermentum tempus.

        Sed ullamcorper, felis vitae suscipit tristique, felis sapien auctor libero, eu luctus turpis sapien pellentesque velit. Phasellus risus urna, eleifend sit amet gravida sit amet, interdum et dui. Nunc pharetra volutpat massa quis luctus. Etiam molestie eros leo, quis suscipit ipsum tempus in. Maecenas suscipit, tortor vehicula ultricies faucibus, justo justo feugiat odio, quis luctus eros justo commodo augue. In malesuada eros tempor gravida eleifend. Donec quis sollicitudin purus. In hac habitasse platea dictumst. Nulla porttitor fringilla porta. Vivamus id ultricies eros. Nullam consectetur diam leo, ac pharetra dolor aliquam sed. Fusce congue velit lacus. Mauris non urna vehicula, placerat lectus sollicitudin, sollicitudin sem. Maecenas sit amet vulputate metus. In hac habitasse platea dictumst. Proin a dui id massa egestas cursus.

        Cras quis elit molestie, tempor nibh et, dictum felis. Pellentesque tristique ipsum magna, id tincidunt ligula ullamcorper id. Morbi laoreet tellus quis neque vehicula, et pretium lacus pellentesque. Aenean gravida felis vitae mauris semper lacinia. Etiam porta mauris eu dolor dictum, sit amet cursus eros facilisis. Curabitur sit amet tellus vel leo dapibus hendrerit. Integer non nunc egestas nisl sollicitudin iaculis.

        Ut vel faucibus lorem. Aliquam erat volutpat. Curabitur eleifend diam in erat aliquam, non semper ipsum ullamcorper. Vivamus sagittis tellus non pretium blandit. Donec tincidunt risus quis leo viverra dignissim. Donec nec elementum lacus, vel malesuada justo. Duis fermentum lacus sit amet lorem tincidunt, quis convallis nisi posuere. Ut luctus turpis feugiat nulla pretium, ac facilisis ex aliquam. Sed elementum dolor non elit mollis maximus. Sed vitae mi neque. Donec pharetra ut odio ac scelerisque. Aenean euismod venenatis lacus, eget venenatis tortor pulvinar ac. Curabitur eget tortor vel lectus hendrerit gravida eget eget augue.

        Mauris eu odio rutrum, congue velit non, faucibus orci. Maecenas facilisis malesuada ullamcorper. Aliquam finibus efficitur molestie. Vestibulum in rhoncus enim. Nunc feugiat non ex at sollicitudin. Nunc viverra enim id suscipit fermentum. Etiam dictum mauris diam, in convallis nisi egestas ac. Pellentesque lobortis rutrum ligula, a ornare felis efficitur vel. Proin ac mauris ipsum. Duis quis luctus nisl. Morbi pharetra enim ac tincidunt feugiat.

        Vivamus lacinia mattis orci at elementum. Suspendisse eu est sit amet eros malesuada ultricies nec a risus. Etiam ac ante lectus. Vivamus tempor nisl commodo mauris posuere gravida. Praesent condimentum bibendum aliquet. Proin sit amet interdum purus. Morbi id semper risus. Sed ac nisi congue, rutrum arcu sit amet, facilisis turpis. Maecenas lacinia placerat odio non auctor. Nam efficitur ex euismod sapien finibus mattis. Fusce vitae odio erat. Maecenas luctus imperdiet risus eget pretium.

        Suspendisse convallis nisl vitae enim consequat porta. Aenean sollicitudin libero nibh, rhoncus vestibulum odio elementum vitae. Etiam non tortor velit. Quisque auctor velit sit amet ex cursus semper. Maecenas aliquet nunc vel metus aliquet, ac maximus odio hendrerit. Aenean pretium sodales lorem. Donec egestas enim at vestibulum sollicitudin. Proin euismod ligula libero, at pharetra turpis consequat vel. Quisque lacinia ornare libero, vitae faucibus enim tincidunt at.

        Quisque tellus nisl, sagittis vel sem in, sagittis commodo eros. Etiam ac mauris lectus. Aliquam tristique, neque vitae egestas volutpat, nunc lacus egestas tellus, ac posuere arcu arcu quis nisi. Pellentesque et enim eu quam porttitor auctor id ac risus. Praesent consectetur, dolor vel mattis viverra, ante libero vestibulum tortor, vitae tempus sapien odio ut tellus. Aenean dapibus vestibulum nisl ut luctus. Suspendisse ac blandit mauris. Ut commodo, nulla eu tincidunt molestie, felis mi rhoncus magna, eu bibendum leo sapien vel neque. Duis gravida porta euismod. Sed volutpat neque id libero efficitur volutpat.

        Nunc ipsum enim, semper molestie orci ut, porttitor ornare nulla. Ut vestibulum interdum tempus. Nullam mollis eros quis neque rhoncus posuere. Ut a ex eu erat sollicitudin dignissim imperdiet eget est. Nulla facilisi. Proin laoreet lectus lorem, in molestie diam maximus ac. Proin lacinia, augue quis auctor volutpat, lorem erat imperdiet ex, et rutrum lectus augue ut nulla. Praesent elementum massa eu felis ultrices efficitur. Ut sapien justo, ornare eget egestas non, porta nec erat. Etiam porttitor turpis finibus egestas congue. Etiam eleifend sit amet erat sed imperdiet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent sit amet sem eu nibh dignissim vulputate et id nibh. Morbi faucibus, enim a rhoncus maximus, urna est egestas purus, non volutpat nulla nunc sit amet mauris.

        Nunc sodales imperdiet est, a condimentum odio consequat ut. Donec sit amet est justo. Morbi in aliquam mi. Mauris efficitur leo ligula, ac rutrum enim commodo vitae. Suspendisse mollis sapien in nisi pharetra tincidunt. Morbi porttitor ipsum urna, eu sagittis eros hendrerit quis. Donec et ultrices enim. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec viverra, odio id dignissim ullamcorper, tortor nisl iaculis nibh, vitae volutpat sapien arcu vitae metus.

        Aliquam commodo a tortor quis ornare. Morbi non odio nibh. Maecenas at neque et magna cursus accumsan non nec orci. Morbi a dolor porta, consectetur mauris finibus, rutrum massa. Donec tempus ut dui eu finibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras eu turpis faucibus, egestas erat quis, imperdiet nibh. Integer erat lectus, congue id faucibus sit amet, rhoncus in sem. Morbi a lacus dictum, tempor leo eget, porta arcu. Maecenas at sodales lorem. Suspendisse potenti. Pellentesque ipsum augue, imperdiet nec justo quis, tincidunt consectetur sem.

        Quisque ipsum enim, euismod at turpis eu, elementum placerat lacus. Nullam felis eros, bibendum in quam sit amet, consectetur pharetra magna. In mollis ultricies lacinia. Proin in fringilla dui, in efficitur nibh. Nunc non orci ante. Praesent placerat tortor tellus, nec imperdiet nunc ornare sit amet. Donec ac nisl non tortor porttitor convallis. Aliquam sit amet ornare metus.

        Sed dictum elit quis lectus scelerisque, eu ultrices ligula ullamcorper. Aliquam tincidunt dolor et posuere vehicula. Donec mattis diam posuere, aliquet eros at, porttitor ligula. Nullam et orci lacinia, mattis nunc non, porttitor dui. Donec pellentesque, velit eu facilisis fermentum, metus diam venenatis ex, eget imperdiet arcu est sit amet mi. Nunc non egestas lorem, et aliquet augue. Sed posuere posuere est, at maximus massa interdum luctus. In eget lectus non nunc sagittis varius eu ac dui. Maecenas sed turpis enim. Nullam condimentum finibus augue sit amet ultricies. Donec vel interdum est, rutrum aliquam orci.

        Nunc nulla urna, tincidunt a dignissim vel, auctor vitae tortor. Suspendisse gravida turpis vitae dolor suscipit molestie. Sed sit amet nisl in ipsum aliquet ultrices. Praesent finibus porta nisi vel dictum. In nec libero pulvinar, imperdiet dui sit amet, viverra metus. Praesent nunc ante, tincidunt sed risus sagittis, finibus sodales lacus. Praesent in urna vitae lectus egestas pretium vel varius lectus. Suspendisse lacinia molestie augue eu dapibus. Ut blandit lacinia condimentum. Nullam eu aliquam lorem. Proin fringilla ac risus at malesuada. Vivamus vestibulum augue in feugiat eleifend. Cras bibendum sagittis diam, ac suscipit justo vulputate at.

        Proin suscipit, elit sit amet facilisis commodo, justo velit condimentum metus, non ornare lorem ex cursus nulla. Fusce consequat vel sapien ut sodales. Morbi a felis porttitor, tempus neque quis, laoreet erat. Vivamus pharetra mi ante, id hendrerit quam venenatis venenatis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas egestas interdum nulla quis semper. Fusce pharetra eu libero sed hendrerit. Etiam commodo urna a nunc pretium tempor. Cras nec aliquam velit, ut commodo diam. Phasellus eget elementum justo. Sed venenatis erat commodo fringilla commodo. Donec posuere ex in urna sodales convallis.

        Proin in dui ac urna maximus maximus non nec velit. Quisque rutrum eros in maximus commodo. Aenean fringilla ac erat nec malesuada. Phasellus nibh arcu, aliquam ac velit et, dignissim condimentum quam. Curabitur sit amet neque varius, egestas sem vel, fringilla magna. Donec arcu dolor, consectetur a pellentesque vestibulum, tincidunt ut massa. Mauris ornare est neque. Ut eu aliquet ipsum. Mauris ut vestibulum felis, non feugiat purus. Praesent elit erat, egestas eu risus nec, pharetra tincidunt tortor. Fusce sed nunc ante. Sed sollicitudin, orci ac pretium elementum, nunc felis imperdiet augue, ut semper metus metus ut elit.

        In arcu lorem, semper et tellus nec, faucibus imperdiet dolor. Nullam vulputate malesuada vehicula. Duis eros eros, cursus vel faucibus in, rhoncus ac diam. Curabitur tempor, sem non dignissim suscipit, odio nisl vestibulum odio, at venenatis lectus mauris in magna. Nulla consectetur vitae ante at faucibus. Morbi rutrum, dolor at interdum feugiat, felis velit pretium orci, vel ullamcorper neque augue et nunc. Proin pharetra dolor justo, sit amet semper quam tincidunt pulvinar. Vestibulum ultrices turpis quis est consequat, sit amet iaculis ex fringilla. Fusce dignissim lorem id bibendum pulvinar. Proin quam arcu, fermentum vel congue vitae, ullamcorper id diam. In tincidunt tristique nisl eget fermentum.

        Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas a ipsum arcu. Nam ac libero sed mauris bibendum faucibus nec a orci. Mauris porttitor hendrerit erat sed convallis. Praesent eu sollicitudin diam. Aenean tristique tincidunt sem. Pellentesque id pellentesque ante. Nunc ac purus nec nunc sollicitudin blandit. Donec id diam nec orci fermentum mollis. Proin euismod risus quis accumsan imperdiet. Donec posuere consequat risus et vehicula.

        Vestibulum vel diam vitae nisi maximus vulputate. Mauris tempor elit sit amet volutpat congue. Ut eu eleifend quam, ac dapibus ligula. Proin eu commodo purus, et tincidunt lectus. Cras at metus porta, lobortis augue in, euismod mi. Donec et cursus ante. Mauris sed metus eu massa fringilla cursus. Pellentesque consectetur dolor feugiat maximus luctus. Sed eu commodo odio, tempor mattis neque.

        Aliquam erat volutpat. Sed fringilla ipsum mi, id vestibulum turpis ornare eget. Proin sed est in ipsum iaculis faucibus vel consequat urna. Curabitur condimentum semper risus, ut fringilla diam venenatis in. Mauris ut ullamcorper justo. Proin et facilisis tortor, ut volutpat felis. Fusce non pulvinar leo. Aliquam sit amet leo in sapien hendrerit accumsan. Maecenas porttitor in ante a egestas. Mauris tempor sed risus ut ornare.

        Vestibulum at maximus sapien. Nullam hendrerit eu elit et hendrerit. Praesent non fermentum dolor, vel vestibulum lacus. Etiam luctus dolor non mauris tincidunt porta. Nullam non luctus diam, sit amet egestas nunc. Integer sed auctor elit, vitae tempor risus. Quisque lorem enim, porta ac augue interdum, volutpat ultricies enim. Nunc aliquet at leo nec bibendum. Nulla tristique, ex sed efficitur tristique, ante leo mattis lacus, eu feugiat orci enim in ante. Etiam in ornare metus, ac faucibus nibh. Nullam sit amet varius lectus, ac egestas tellus. Sed porttitor, massa a pulvinar dapibus, ante erat varius diam, quis faucibus justo nisl eget lectus. Praesent ut urna ac turpis ultrices fringilla ullamcorper quis elit.

        In blandit convallis ornare. Donec augue leo, egestas sed est et, volutpat tempor urna. Nulla eget lobortis lectus. Curabitur vitae lectus dui. Praesent eu augue orci. Mauris ultricies magna elit, non vulputate est condimentum sit amet. Vestibulum arcu massa, rutrum vitae consequat at, ornare sed nunc.

        In hac habitasse platea dictumst. Curabitur blandit faucibus porta. Vestibulum et venenatis diam. Morbi vel sapien ultricies, sollicitudin quam non, faucibus felis. Fusce ut sem felis. Donec fringilla ligula nisl. Phasellus gravida posuere ipsum, at dignissim ipsum ullamcorper et. Vestibulum maximus orci in sollicitudin egestas. Aenean pharetra, urna in dapibus porta, urna justo porttitor diam, ac tristique purus mi quis erat. Etiam quis malesuada tortor.

        Nulla laoreet, nulla ac vestibulum maximus, lacus nunc euismod metus, quis suscipit nisl enim a libero. Praesent auctor mi sagittis libero ultricies tincidunt. Quisque non urna vitae enim vestibulum faucibus. Pellentesque quis luctus est. Etiam at turpis sed nibh euismod vehicula id in odio. Suspendisse id quam varius, venenatis odio nec, convallis velit. Praesent eu nibh augue. Aliquam ultrices tortor id turpis rutrum, quis rhoncus mauris tincidunt. Phasellus nec fermentum augue. Ut interdum at arcu vel lacinia.

        Proin mollis purus non lacinia malesuada. Quisque mattis magna ligula, et pellentesque risus pretium eget. Quisque quis lectus orci. Integer pellentesque mattis lectus et rutrum. Ut in interdum risus. Cras sit amet efficitur dui. Morbi pulvinar, leo euismod faucibus posuere, dolor erat lobortis diam, vel malesuada risus leo id neque. Nam rutrum dolor massa, eget eleifend velit eleifend nec.

        Duis eget fermentum enim, vel finibus enim. Nulla turpis nulla, consectetur non eleifend eget, pharetra vel nisi. Pellentesque lacinia eros quis ultricies consectetur. Mauris sit amet dui non tortor varius blandit. Donec bibendum nec dolor sed dignissim. Nullam vehicula neque nec ullamcorper posuere. Vestibulum blandit turpis sit amet elit vulputate dapibus ut in sapien. Aenean pharetra nisl quis justo dictum, a tempus risus ullamcorper.

        Donec tempor, mauris et sodales tempus, velit dui ornare lacus, sit amet dapibus odio neque et dolor. Mauris at ultrices arcu, eu feugiat velit. Integer consequat vulputate nisl, quis pretium felis venenatis sed. Fusce posuere odio augue, ut sollicitudin ipsum semper commodo. Phasellus sit amet quam nec eros dapibus vehicula. Vestibulum lectus magna, facilisis nec molestie a, pellentesque eu justo. Phasellus quis posuere ante.
        """
}
